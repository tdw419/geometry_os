; DESCRIPTION: Renders a yellow box of size 26x104 starting at (46, 110).
; PLAN: r0=46(x), r1=110(y), r2=26(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 110
LDI r2, 26
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
