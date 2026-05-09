; DESCRIPTION: Places a green line segment connecting (69, 107) to (300, 131).
; PLAN: r0=69(x1), r1=107(y1), r2=300(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 107
LDI r2, 300
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
