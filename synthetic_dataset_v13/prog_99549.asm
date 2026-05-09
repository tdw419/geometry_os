; DESCRIPTION: Composite: Renders a white disk with center (151, 103) and radius 30 then Places a blue line segment connecting (378, 133) to (76, 192) then Places a magenta dot at position (129, 166).
; PLAN: r0=151(x), r1=103(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x1), r6=133(y1), r7=76(x2), r8=192(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=166(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 151
LDI r1, 103
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 133
LDI r7, 76
LDI r8, 192
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 166
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
