; DESCRIPTION: Renders a yellow box of size 10x104 starting at (431, 25).
; PLAN: r0=431(x), r1=25(y), r2=10(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 25
LDI r2, 10
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
