; DESCRIPTION: Composite: Places a orange dot at position (357, 183) then Renders a magenta line between points (65, 40) and (346, 90) then Creates a red circular shape at (452, 98) with radius 52.
; PLAN: r0=357(x), r1=183(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=65(x1), r6=40(y1), r7=346(x2), r8=90(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=452(x), r11=98(y), r12=52(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 357
LDI r1, 183
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 65
LDI r6, 40
LDI r7, 346
LDI r8, 90
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 98
LDI r12, 52
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
