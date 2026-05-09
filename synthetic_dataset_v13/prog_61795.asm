; DESCRIPTION: Composite: Renders a green disk with center (230, 71) and radius 58 then Places a red line segment connecting (125, 245) to (330, 199).
; PLAN: r0=230(x), r1=71(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x1), r6=245(y1), r7=330(x2), r8=199(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 71
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 245
LDI r7, 330
LDI r8, 199
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
