; DESCRIPTION: Composite: Places a purple circle of radius 63 at center (185, 129) then Draws a blue line from (78, 42) to (466, 140).
; PLAN: r0=185(x), r1=129(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x1), r6=42(y1), r7=466(x2), r8=140(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 129
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 42
LDI r7, 466
LDI r8, 140
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
