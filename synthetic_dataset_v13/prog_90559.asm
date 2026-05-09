; DESCRIPTION: Places a green line segment connecting (24, 137) to (20, 146).
; PLAN: r0=24(x1), r1=137(y1), r2=20(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 137
LDI r2, 20
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
