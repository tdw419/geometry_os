; DESCRIPTION: Composite: Renders a red disk with center (278, 175) and radius 37 then Places a green line segment connecting (506, 6) to (486, 210).
; PLAN: r0=278(x), r1=175(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=506(x1), r6=6(y1), r7=486(x2), r8=210(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 175
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 506
LDI r6, 6
LDI r7, 486
LDI r8, 210
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
