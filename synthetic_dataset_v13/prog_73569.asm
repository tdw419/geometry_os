; DESCRIPTION: Places a green line segment connecting (362, 9) to (486, 76).
; PLAN: r0=362(x1), r1=9(y1), r2=486(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 9
LDI r2, 486
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
