; DESCRIPTION: Places a blue line segment connecting (308, 187) to (161, 107).
; PLAN: r0=308(x1), r1=187(y1), r2=161(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 187
LDI r2, 161
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
