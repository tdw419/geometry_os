; DESCRIPTION: Composite: Renders a red line between points (413, 40) and (112, 91) then Draws a red circle centered at (342, 171) with radius 48 then Places a blue dot at position (254, 189).
; PLAN: r0=413(x1), r1=40(y1), r2=112(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=171(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=254(x), r11=189(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 413
LDI r1, 40
LDI r2, 112
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 171
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 254
LDI r11, 189
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
