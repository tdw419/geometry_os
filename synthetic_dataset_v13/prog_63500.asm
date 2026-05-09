; DESCRIPTION: Composite: Draws a cyan circle centered at (284, 144) with radius 56 then Places a blue dot at position (211, 241) then Draws a orange line from (364, 197) to (389, 252).
; PLAN: r0=284(x), r1=144(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=241(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=364(x1), r11=197(y1), r12=389(x2), r13=252(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 144
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 241
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 364
LDI r11, 197
LDI r12, 389
LDI r13, 252
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
