; DESCRIPTION: Composite: Draws a cyan circle centered at (415, 29) with radius 23 then Draws a blue line from (36, 97) to (349, 160).
; PLAN: r0=415(x), r1=29(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x1), r6=97(y1), r7=349(x2), r8=160(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 29
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 97
LDI r7, 349
LDI r8, 160
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
