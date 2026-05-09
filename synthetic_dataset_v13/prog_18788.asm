; DESCRIPTION: Renders a black box of size 33x58 starting at (423, 9).
; PLAN: r0=423(x), r1=9(y), r2=33(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 9
LDI r2, 33
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
