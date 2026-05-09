; DESCRIPTION: Creates a red rectangular region at (165, 134) spanning 30 by 98 pixels.
; PLAN: r0=165(x), r1=134(y), r2=30(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 134
LDI r2, 30
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
