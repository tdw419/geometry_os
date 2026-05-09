; DESCRIPTION: Composite: Draws a black line from (248, 59) to (469, 229) then Draws a green circle centered at (68, 80) with radius 62.
; PLAN: r0=248(x1), r1=59(y1), r2=469(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=80(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 59
LDI r2, 469
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 80
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
