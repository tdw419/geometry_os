; DESCRIPTION: Composite: Places a green circle of radius 47 at center (104, 188) then Places a orange dot at position (448, 53) then Draws a green line from (134, 8) to (113, 39).
; PLAN: r0=104(x), r1=188(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x), r6=53(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=134(x1), r11=8(y1), r12=113(x2), r13=39(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 188
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 53
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 134
LDI r11, 8
LDI r12, 113
LDI r13, 39
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
