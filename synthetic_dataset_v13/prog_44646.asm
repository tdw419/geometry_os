; DESCRIPTION: Composite: Places a green dot at position (149, 137) then Draws a magenta line from (341, 193) to (354, 40) then Places a purple circle of radius 10 at center (172, 210).
; PLAN: r0=149(x), r1=137(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=341(x1), r6=193(y1), r7=354(x2), r8=40(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=210(y), r12=10(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 149
LDI r1, 137
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 341
LDI r6, 193
LDI r7, 354
LDI r8, 40
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 210
LDI r12, 10
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
