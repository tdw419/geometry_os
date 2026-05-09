; DESCRIPTION: Composite: Places a blue line segment connecting (316, 34) to (256, 79) then Sets a single green pixel at (336, 220).
; PLAN: r0=316(x1), r1=34(y1), r2=256(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=220(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 316
LDI r1, 34
LDI r2, 256
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 220
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
