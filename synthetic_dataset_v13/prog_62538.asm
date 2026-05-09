; DESCRIPTION: Composite: Renders a cyan disk with center (267, 199) and radius 54 then Sets a single yellow pixel at (88, 213) then Renders a magenta line between points (251, 37) and (103, 237).
; PLAN: r0=267(x), r1=199(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x), r6=213(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=251(x1), r11=37(y1), r12=103(x2), r13=237(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 199
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 213
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 251
LDI r11, 37
LDI r12, 103
LDI r13, 237
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
