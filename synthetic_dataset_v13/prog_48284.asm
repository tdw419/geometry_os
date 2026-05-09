; DESCRIPTION: Composite: Places a white line segment connecting (202, 121) to (294, 148) then Renders a black disk with center (260, 169) and radius 54 then Places a magenta dot at position (451, 5).
; PLAN: r0=202(x1), r1=121(y1), r2=294(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=169(y), r7=54(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=451(x), r11=5(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 202
LDI r1, 121
LDI r2, 294
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 169
LDI r7, 54
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 451
LDI r11, 5
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
