; DESCRIPTION: Composite: Draws a yellow circle centered at (37, 133) with radius 10 then Draws a orange line from (345, 144) to (210, 98) then Places a green dot at position (371, 19).
; PLAN: r0=37(x), r1=133(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x1), r6=144(y1), r7=210(x2), r8=98(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=371(x), r11=19(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 37
LDI r1, 133
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 144
LDI r7, 210
LDI r8, 98
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 19
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
