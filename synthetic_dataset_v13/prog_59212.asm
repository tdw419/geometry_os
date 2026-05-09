; DESCRIPTION: Composite: Places a white line segment connecting (418, 234) to (363, 125) then Renders a yellow box of size 73x101 starting at (389, 131).
; PLAN: r0=418(x1), r1=234(y1), r2=363(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=131(y), r7=73(width), r8=101(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 234
LDI r2, 363
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 131
LDI r7, 73
LDI r8, 101
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
