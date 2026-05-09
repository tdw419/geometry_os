; DESCRIPTION: Creates a red rectangular region at (389, 134) spanning 64 by 33 pixels.
; PLAN: r0=389(x), r1=134(y), r2=64(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 134
LDI r2, 64
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
