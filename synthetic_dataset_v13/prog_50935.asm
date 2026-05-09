; DESCRIPTION: Composite: Renders a purple line between points (89, 66) and (424, 232) then Creates a green rectangular region at (284, 195) spanning 91 by 51 pixels.
; PLAN: r0=89(x1), r1=66(y1), r2=424(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=195(y), r7=91(width), r8=51(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 66
LDI r2, 424
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 195
LDI r7, 91
LDI r8, 51
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
