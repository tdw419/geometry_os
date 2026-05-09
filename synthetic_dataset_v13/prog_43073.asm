; DESCRIPTION: Renders a black box of size 13x33 starting at (180, 88).
; PLAN: r0=180(x), r1=88(y), r2=13(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 88
LDI r2, 13
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
