; DESCRIPTION: Composite: Places a magenta line segment connecting (507, 103) to (120, 207) then Sets a single purple pixel at (200, 103).
; PLAN: r0=507(x1), r1=103(y1), r2=120(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=103(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 507
LDI r1, 103
LDI r2, 120
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 103
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
