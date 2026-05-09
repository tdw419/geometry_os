; DESCRIPTION: Places a blue line segment connecting (297, 45) to (394, 146).
; PLAN: r0=297(x1), r1=45(y1), r2=394(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 45
LDI r2, 394
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
