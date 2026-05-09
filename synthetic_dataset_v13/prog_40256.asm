; DESCRIPTION: Composite: Renders a orange disk with center (310, 179) and radius 59 then Draws a magenta line from (351, 245) to (397, 204) then Sets a single blue pixel at (345, 132).
; PLAN: r0=310(x), r1=179(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x1), r6=245(y1), r7=397(x2), r8=204(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=345(x), r11=132(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 310
LDI r1, 179
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 245
LDI r7, 397
LDI r8, 204
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 132
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
