; DESCRIPTION: Composite: Renders a orange disk with center (74, 182) and radius 54 then Renders a magenta line between points (334, 252) and (307, 212) then Sets a single magenta pixel at (242, 35).
; PLAN: r0=74(x), r1=182(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x1), r6=252(y1), r7=307(x2), r8=212(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=242(x), r11=35(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 74
LDI r1, 182
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 252
LDI r7, 307
LDI r8, 212
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 35
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
