; DESCRIPTION: Composite: Renders a blue disk with center (125, 125) and radius 22 then Draws a cyan line from (302, 126) to (104, 114).
; PLAN: r0=125(x), r1=125(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x1), r6=126(y1), r7=104(x2), r8=114(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 125
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 126
LDI r7, 104
LDI r8, 114
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
