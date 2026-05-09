; DESCRIPTION: Composite: Renders a blue disk with center (317, 113) and radius 60 then Places a green line segment connecting (279, 184) to (36, 134) then Places a blue dot at position (19, 125).
; PLAN: r0=317(x), r1=113(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x1), r6=184(y1), r7=36(x2), r8=134(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=19(x), r11=125(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 317
LDI r1, 113
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 184
LDI r7, 36
LDI r8, 134
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 125
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
