; DESCRIPTION: Renders a blue box of size 115x76 starting at (347, 152).
; PLAN: r0=347(x), r1=152(y), r2=115(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 152
LDI r2, 115
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
