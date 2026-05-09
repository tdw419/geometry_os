; DESCRIPTION: Composite: Draws a cyan line from (483, 156) to (196, 155) then Renders a cyan disk with center (150, 130) and radius 68.
; PLAN: r0=483(x1), r1=156(y1), r2=196(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=130(y), r7=68(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 156
LDI r2, 196
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 130
LDI r7, 68
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
