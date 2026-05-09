; DESCRIPTION: Composite: Places a black dot at position (357, 250) then Draws a orange line from (446, 80) to (145, 168) then Creates a red circular shape at (379, 45) with radius 32.
; PLAN: r0=357(x), r1=250(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=446(x1), r6=80(y1), r7=145(x2), r8=168(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=379(x), r11=45(y), r12=32(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 357
LDI r1, 250
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 446
LDI r6, 80
LDI r7, 145
LDI r8, 168
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 45
LDI r12, 32
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
