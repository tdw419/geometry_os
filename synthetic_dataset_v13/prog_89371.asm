; DESCRIPTION: Composite: Renders a purple box of size 21x25 starting at (177, 103) then Sets a single purple pixel at (208, 240) then Draws a magenta line from (223, 107) to (441, 160).
; PLAN: r0=177(x), r1=103(y), r2=21(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=240(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=223(x1), r11=107(y1), r12=441(x2), r13=160(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 103
LDI r2, 21
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 240
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 223
LDI r11, 107
LDI r12, 441
LDI r13, 160
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
