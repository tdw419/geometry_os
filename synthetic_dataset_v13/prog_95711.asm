; DESCRIPTION: Composite: Renders a white disk with center (45, 164) and radius 23 then Draws a green line from (144, 110) to (341, 82).
; PLAN: r0=45(x), r1=164(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x1), r6=110(y1), r7=341(x2), r8=82(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 164
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 110
LDI r7, 341
LDI r8, 82
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
