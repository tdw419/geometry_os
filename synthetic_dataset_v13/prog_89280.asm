; DESCRIPTION: Composite: Sets a single yellow pixel at (247, 239) then Draws a green line from (499, 134) to (298, 160) then Renders a green disk with center (89, 124) and radius 37.
; PLAN: r0=247(x), r1=239(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=499(x1), r6=134(y1), r7=298(x2), r8=160(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=89(x), r11=124(y), r12=37(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 239
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 499
LDI r6, 134
LDI r7, 298
LDI r8, 160
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 124
LDI r12, 37
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
