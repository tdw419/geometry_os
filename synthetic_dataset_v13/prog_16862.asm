; DESCRIPTION: Places a blue line segment connecting (168, 96) to (365, 251).
; PLAN: r0=168(x1), r1=96(y1), r2=365(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 96
LDI r2, 365
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
