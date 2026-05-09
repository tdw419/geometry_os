; DESCRIPTION: Composite: Draws a yellow line from (395, 152) to (153, 246) then Draws a green circle centered at (124, 117) with radius 11.
; PLAN: r0=395(x1), r1=152(y1), r2=153(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=117(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 395
LDI r1, 152
LDI r2, 153
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 117
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
