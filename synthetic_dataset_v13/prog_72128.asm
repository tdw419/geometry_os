; DESCRIPTION: Composite: Places a white circle of radius 23 at center (428, 126) then Renders a blue line between points (434, 234) and (201, 226).
; PLAN: r0=428(x), r1=126(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x1), r6=234(y1), r7=201(x2), r8=226(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 126
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 234
LDI r7, 201
LDI r8, 226
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
