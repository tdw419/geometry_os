; DESCRIPTION: Composite: Places a black line segment connecting (69, 90) to (278, 178) then Draws a blue circle centered at (367, 71) with radius 66 then Sets a single magenta pixel at (382, 15).
; PLAN: r0=69(x1), r1=90(y1), r2=278(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=71(y), r7=66(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=382(x), r11=15(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 90
LDI r2, 278
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 71
LDI r7, 66
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 382
LDI r11, 15
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
