; DESCRIPTION: Composite: Sets a single white pixel at (275, 147) then Draws a black line from (56, 55) to (236, 21) then Renders a green disk with center (245, 178) and radius 42.
; PLAN: r0=275(x), r1=147(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=56(x1), r6=55(y1), r7=236(x2), r8=21(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=245(x), r11=178(y), r12=42(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 275
LDI r1, 147
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 56
LDI r6, 55
LDI r7, 236
LDI r8, 21
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 178
LDI r12, 42
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
