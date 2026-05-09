; DESCRIPTION: Places a white line segment connecting (215, 119) to (6, 221).
; PLAN: r0=215(x1), r1=119(y1), r2=6(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 119
LDI r2, 6
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
