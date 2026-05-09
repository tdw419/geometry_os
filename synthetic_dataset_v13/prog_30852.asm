; DESCRIPTION: Creates a red rectangular region at (48, 134) spanning 60 by 57 pixels.
; PLAN: r0=48(x), r1=134(y), r2=60(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 134
LDI r2, 60
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
