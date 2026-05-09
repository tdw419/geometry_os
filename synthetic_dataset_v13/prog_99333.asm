; DESCRIPTION: Composite: Renders a green disk with center (327, 121) and radius 12 then Places a magenta line segment connecting (22, 87) to (24, 129) then Sets a single green pixel at (472, 141).
; PLAN: r0=327(x), r1=121(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x1), r6=87(y1), r7=24(x2), r8=129(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=472(x), r11=141(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 327
LDI r1, 121
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 87
LDI r7, 24
LDI r8, 129
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 141
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
