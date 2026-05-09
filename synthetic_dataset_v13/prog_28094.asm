; DESCRIPTION: Composite: Places a blue line segment connecting (271, 170) to (59, 7) then Sets a single green pixel at (165, 20).
; PLAN: r0=271(x1), r1=170(y1), r2=59(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=20(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 170
LDI r2, 59
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 20
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
