; DESCRIPTION: Composite: Draws a magenta line from (406, 101) to (74, 40) then Renders a orange disk with center (182, 182) and radius 72.
; PLAN: r0=406(x1), r1=101(y1), r2=74(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=182(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 101
LDI r2, 74
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 182
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
