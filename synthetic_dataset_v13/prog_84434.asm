; DESCRIPTION: Renders a yellow box of size 36x68 starting at (469, 110).
; PLAN: r0=469(x), r1=110(y), r2=36(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 110
LDI r2, 36
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
