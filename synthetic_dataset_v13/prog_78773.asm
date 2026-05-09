; DESCRIPTION: Composite: Places a magenta line segment connecting (202, 155) to (182, 242) then Places a red circle of radius 46 at center (427, 181).
; PLAN: r0=202(x1), r1=155(y1), r2=182(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=181(y), r7=46(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 202
LDI r1, 155
LDI r2, 182
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 181
LDI r7, 46
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
