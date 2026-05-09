; DESCRIPTION: Composite: Draws a yellow line from (165, 21) to (67, 84) then Places a blue dot at position (402, 90).
; PLAN: r0=165(x1), r1=21(y1), r2=67(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=90(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 21
LDI r2, 67
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 90
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
