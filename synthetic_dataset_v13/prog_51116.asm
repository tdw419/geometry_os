; DESCRIPTION: Places a red line segment connecting (449, 107) to (325, 50).
; PLAN: r0=449(x1), r1=107(y1), r2=325(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 107
LDI r2, 325
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
