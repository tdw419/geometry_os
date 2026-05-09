; DESCRIPTION: Composite: Draws a blue circle centered at (136, 143) with radius 70 then Renders a magenta line between points (18, 120) and (135, 47) then Sets a single magenta pixel at (141, 59).
; PLAN: r0=136(x), r1=143(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x1), r6=120(y1), r7=135(x2), r8=47(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=141(x), r11=59(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 136
LDI r1, 143
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 120
LDI r7, 135
LDI r8, 47
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 59
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
