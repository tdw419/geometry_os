; DESCRIPTION: Composite: Draws a yellow circle centered at (311, 82) with radius 79 then Draws a blue line from (396, 39) to (24, 254) then Places a yellow dot at position (466, 65).
; PLAN: r0=311(x), r1=82(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x1), r6=39(y1), r7=24(x2), r8=254(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=466(x), r11=65(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 311
LDI r1, 82
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 39
LDI r7, 24
LDI r8, 254
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 65
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
