; DESCRIPTION: Renders a white box of size 65x17 starting at (347, 196).
; PLAN: r0=347(x), r1=196(y), r2=65(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 196
LDI r2, 65
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
