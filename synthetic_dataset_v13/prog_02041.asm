; DESCRIPTION: Composite: Renders a green line between points (331, 207) and (231, 127) then Draws a white circle centered at (477, 30) with radius 12.
; PLAN: r0=331(x1), r1=207(y1), r2=231(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=477(x), r6=30(y), r7=12(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 331
LDI r1, 207
LDI r2, 231
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 30
LDI r7, 12
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
