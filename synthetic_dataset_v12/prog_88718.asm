; DESCRIPTION: Composite: Places a green dot at position (64, 224) then Draws a orange circle centered at (88, 57) with radius 10 then Draws a magenta line from (477, 59) to (217, 185).
; PLAN: r0=64(x), r1=224(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=57(y), r7=10(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=477(x1), r11=59(y1), r12=217(x2), r13=185(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 224
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 88
LDI r6, 57
LDI r7, 10
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 477
LDI r11, 59
LDI r12, 217
LDI r13, 185
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
