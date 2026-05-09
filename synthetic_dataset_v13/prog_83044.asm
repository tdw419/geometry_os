; DESCRIPTION: Composite: Places a blue line segment connecting (132, 142) to (5, 126) then Sets a single green pixel at (371, 27).
; PLAN: r0=132(x1), r1=142(y1), r2=5(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=27(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 132
LDI r1, 142
LDI r2, 5
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 27
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
