; DESCRIPTION: Composite: Places a yellow dot at position (137, 137) then Places a black circle of radius 16 at center (406, 20) then Draws a magenta line from (100, 194) to (309, 87).
; PLAN: r0=137(x), r1=137(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=20(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=100(x1), r11=194(y1), r12=309(x2), r13=87(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 137
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 406
LDI r6, 20
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 100
LDI r11, 194
LDI r12, 309
LDI r13, 87
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
