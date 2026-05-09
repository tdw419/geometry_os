; DESCRIPTION: Composite: Sets a single yellow pixel at (489, 28) then Places a magenta line segment connecting (19, 19) to (27, 24) then Renders a red disk with center (224, 139) and radius 35.
; PLAN: r0=489(x), r1=28(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=19(x1), r6=19(y1), r7=27(x2), r8=24(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=224(x), r11=139(y), r12=35(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 489
LDI r1, 28
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 19
LDI r6, 19
LDI r7, 27
LDI r8, 24
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 139
LDI r12, 35
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
