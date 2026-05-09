; DESCRIPTION: Places a orange line segment connecting (196, 107) to (393, 207).
; PLAN: r0=196(x1), r1=107(y1), r2=393(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 107
LDI r2, 393
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
