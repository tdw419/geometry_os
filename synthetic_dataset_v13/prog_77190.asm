; DESCRIPTION: Composite: Draws a yellow circle centered at (296, 198) with radius 25 then Draws a black line from (104, 140) to (350, 139) then Places a cyan dot at position (447, 231).
; PLAN: r0=296(x), r1=198(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x1), r6=140(y1), r7=350(x2), r8=139(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=447(x), r11=231(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 296
LDI r1, 198
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 140
LDI r7, 350
LDI r8, 139
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 231
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
