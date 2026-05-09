; DESCRIPTION: Composite: Places a yellow line segment connecting (464, 10) to (393, 107) then Sets a single purple pixel at (317, 81).
; PLAN: r0=464(x1), r1=10(y1), r2=393(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=81(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 464
LDI r1, 10
LDI r2, 393
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 81
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
