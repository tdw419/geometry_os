; DESCRIPTION: Composite: Places a magenta line segment connecting (186, 237) to (65, 77) then Places a red dot at position (146, 98) then Places a purple circle of radius 36 at center (66, 80).
; PLAN: r0=186(x1), r1=237(y1), r2=65(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=98(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=66(x), r11=80(y), r12=36(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 186
LDI r1, 237
LDI r2, 65
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 98
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 66
LDI r11, 80
LDI r12, 36
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
