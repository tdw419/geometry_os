; DESCRIPTION: Composite: Renders a green disk with center (465, 209) and radius 13 then Sets a single purple pixel at (77, 169) then Renders a red line between points (345, 158) and (138, 161).
; PLAN: r0=465(x), r1=209(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=169(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=345(x1), r11=158(y1), r12=138(x2), r13=161(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 209
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 169
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 345
LDI r11, 158
LDI r12, 138
LDI r13, 161
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
