; DESCRIPTION: Composite: Places a green line segment connecting (393, 25) to (277, 188) then Sets a single black pixel at (321, 215) then Places a magenta circle of radius 54 at center (309, 199).
; PLAN: r0=393(x1), r1=25(y1), r2=277(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=215(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=309(x), r11=199(y), r12=54(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 25
LDI r2, 277
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 215
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 309
LDI r11, 199
LDI r12, 54
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
