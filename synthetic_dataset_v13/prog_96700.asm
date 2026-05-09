; DESCRIPTION: Composite: Renders a magenta line between points (267, 26) and (268, 34) then Renders a green disk with center (432, 190) and radius 55.
; PLAN: r0=267(x1), r1=26(y1), r2=268(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=190(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 267
LDI r1, 26
LDI r2, 268
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 190
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
