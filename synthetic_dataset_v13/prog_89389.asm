; DESCRIPTION: Composite: Renders a magenta disk with center (43, 170) and radius 11 then Draws a cyan line from (414, 191) to (306, 152).
; PLAN: r0=43(x), r1=170(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x1), r6=191(y1), r7=306(x2), r8=152(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 170
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 191
LDI r7, 306
LDI r8, 152
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
