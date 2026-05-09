; DESCRIPTION: Composite: Draws a green circle centered at (351, 221) with radius 27 then Places a yellow line segment connecting (166, 25) to (398, 106) then Places a blue dot at position (104, 231).
; PLAN: r0=351(x), r1=221(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x1), r6=25(y1), r7=398(x2), r8=106(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=104(x), r11=231(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 351
LDI r1, 221
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 25
LDI r7, 398
LDI r8, 106
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 231
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
