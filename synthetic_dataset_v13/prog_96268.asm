; DESCRIPTION: Composite: Sets a single magenta pixel at (247, 78) then Draws a purple circle centered at (386, 85) with radius 30 then Draws a red line from (191, 132) to (489, 146).
; PLAN: r0=247(x), r1=78(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=85(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=191(x1), r11=132(y1), r12=489(x2), r13=146(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 78
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 386
LDI r6, 85
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 191
LDI r11, 132
LDI r12, 489
LDI r13, 146
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
