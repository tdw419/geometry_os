; DESCRIPTION: Composite: Draws a cyan circle centered at (351, 136) with radius 79 then Draws a yellow line from (60, 59) to (76, 231) then Places a white dot at position (114, 128).
; PLAN: r0=351(x), r1=136(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x1), r6=59(y1), r7=76(x2), r8=231(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=128(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 351
LDI r1, 136
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 59
LDI r7, 76
LDI r8, 231
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 128
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
