; DESCRIPTION: Composite: Renders a green disk with center (141, 113) and radius 44 then Draws a red line from (161, 132) to (160, 192) then Sets a single magenta pixel at (407, 174).
; PLAN: r0=141(x), r1=113(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x1), r6=132(y1), r7=160(x2), r8=192(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=407(x), r11=174(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 141
LDI r1, 113
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 132
LDI r7, 160
LDI r8, 192
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 174
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
