; DESCRIPTION: Composite: Sets a single yellow pixel at (353, 37) then Draws a magenta line from (160, 82) to (365, 184) then Draws a black circle centered at (39, 29) with radius 13.
; PLAN: r0=353(x), r1=37(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=160(x1), r6=82(y1), r7=365(x2), r8=184(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=39(x), r11=29(y), r12=13(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 37
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 160
LDI r6, 82
LDI r7, 365
LDI r8, 184
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 29
LDI r12, 13
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
