; DESCRIPTION: Creates a green rectangular region at (85, 55) spanning 19 by 18 pixels.
; PLAN: r0=85(x), r1=55(y), r2=19(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 55
LDI r2, 19
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
