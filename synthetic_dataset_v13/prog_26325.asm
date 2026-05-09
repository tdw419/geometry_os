; DESCRIPTION: Composite: Draws a magenta line from (306, 73) to (190, 64) then Places a green dot at position (147, 39) then Places a red circle of radius 73 at center (260, 132).
; PLAN: r0=306(x1), r1=73(y1), r2=190(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=147(x), r6=39(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=260(x), r11=132(y), r12=73(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 306
LDI r1, 73
LDI r2, 190
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 39
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 260
LDI r11, 132
LDI r12, 73
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
