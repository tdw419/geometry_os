; DESCRIPTION: Renders a black box of size 77x103 starting at (196, 110).
; PLAN: r0=196(x), r1=110(y), r2=77(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 110
LDI r2, 77
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
