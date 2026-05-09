; DESCRIPTION: Renders a black box of size 96x98 starting at (54, 110).
; PLAN: r0=54(x), r1=110(y), r2=96(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 110
LDI r2, 96
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
