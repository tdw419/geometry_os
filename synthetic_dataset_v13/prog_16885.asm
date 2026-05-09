; DESCRIPTION: Places a green line segment connecting (13, 226) to (247, 60).
; PLAN: r0=13(x1), r1=226(y1), r2=247(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 226
LDI r2, 247
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
