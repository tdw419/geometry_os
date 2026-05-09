; DESCRIPTION: Places a cyan line segment connecting (308, 140) to (453, 161).
; PLAN: r0=308(x1), r1=140(y1), r2=453(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 140
LDI r2, 453
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
