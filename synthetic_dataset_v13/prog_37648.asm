; DESCRIPTION: Renders a yellow box of size 104x105 starting at (350, 23).
; PLAN: r0=350(x), r1=23(y), r2=104(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 23
LDI r2, 104
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
