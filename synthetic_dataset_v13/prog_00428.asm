; DESCRIPTION: Composite: Draws a yellow circle centered at (379, 81) with radius 50 then Draws a green line from (318, 125) to (10, 197) then Places a red dot at position (244, 188).
; PLAN: r0=379(x), r1=81(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x1), r6=125(y1), r7=10(x2), r8=197(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=244(x), r11=188(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 379
LDI r1, 81
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 125
LDI r7, 10
LDI r8, 197
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 188
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
