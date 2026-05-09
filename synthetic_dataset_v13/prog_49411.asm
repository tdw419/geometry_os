; DESCRIPTION: Composite: Draws a green line from (341, 250) to (388, 8) then Draws a red circle centered at (370, 127) with radius 24.
; PLAN: r0=341(x1), r1=250(y1), r2=388(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=127(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 250
LDI r2, 388
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 127
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
