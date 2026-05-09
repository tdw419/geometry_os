; DESCRIPTION: Composite: Draws a blue line from (316, 233) to (19, 75) then Creates a black circular shape at (263, 132) with radius 50 then Places a green dot at position (329, 168).
; PLAN: r0=316(x1), r1=233(y1), r2=19(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=132(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=329(x), r11=168(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 316
LDI r1, 233
LDI r2, 19
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 132
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 329
LDI r11, 168
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
