; DESCRIPTION: Composite: Places a white line segment connecting (448, 157) to (111, 117) then Sets a single green pixel at (453, 253).
; PLAN: r0=448(x1), r1=157(y1), r2=111(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=253(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 448
LDI r1, 157
LDI r2, 111
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 253
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
