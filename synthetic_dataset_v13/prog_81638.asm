; DESCRIPTION: Composite: Draws a green circle centered at (99, 66) with radius 40 then Draws a black line from (425, 133) to (369, 255) then Sets a single magenta pixel at (245, 22).
; PLAN: r0=99(x), r1=66(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x1), r6=133(y1), r7=369(x2), r8=255(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=245(x), r11=22(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 99
LDI r1, 66
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 133
LDI r7, 369
LDI r8, 255
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 22
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
