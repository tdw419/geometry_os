; DESCRIPTION: Composite: Places a orange circle of radius 51 at center (398, 127) then Renders a black line between points (274, 113) and (442, 189).
; PLAN: r0=398(x), r1=127(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x1), r6=113(y1), r7=442(x2), r8=189(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 127
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 113
LDI r7, 442
LDI r8, 189
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
