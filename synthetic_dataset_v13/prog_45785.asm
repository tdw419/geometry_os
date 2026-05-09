; DESCRIPTION: Composite: Draws a yellow circle centered at (374, 22) with radius 22 then Renders a yellow line between points (499, 89) and (260, 210) then Sets a single magenta pixel at (470, 198).
; PLAN: r0=374(x), r1=22(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=499(x1), r6=89(y1), r7=260(x2), r8=210(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=470(x), r11=198(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 374
LDI r1, 22
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 499
LDI r6, 89
LDI r7, 260
LDI r8, 210
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 198
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
