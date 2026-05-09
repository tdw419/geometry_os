; DESCRIPTION: Composite: Sets a single magenta pixel at (453, 66) then Draws a red line from (487, 198) to (82, 87) then Creates a yellow circular shape at (432, 152) with radius 19.
; PLAN: r0=453(x), r1=66(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=487(x1), r6=198(y1), r7=82(x2), r8=87(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=432(x), r11=152(y), r12=19(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 66
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 487
LDI r6, 198
LDI r7, 82
LDI r8, 87
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 432
LDI r11, 152
LDI r12, 19
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
