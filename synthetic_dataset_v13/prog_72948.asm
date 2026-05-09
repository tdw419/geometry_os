; DESCRIPTION: Composite: Draws a green circle centered at (145, 117) with radius 56 then Draws a orange line from (223, 103) to (480, 25) then Places a red dot at position (318, 25).
; PLAN: r0=145(x), r1=117(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x1), r6=103(y1), r7=480(x2), r8=25(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=318(x), r11=25(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 145
LDI r1, 117
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 103
LDI r7, 480
LDI r8, 25
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 25
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
