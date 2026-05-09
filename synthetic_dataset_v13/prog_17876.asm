; DESCRIPTION: Composite: Draws a cyan circle centered at (270, 197) with radius 55 then Draws a blue line from (49, 72) to (323, 37).
; PLAN: r0=270(x), r1=197(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x1), r6=72(y1), r7=323(x2), r8=37(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 197
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 72
LDI r7, 323
LDI r8, 37
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
