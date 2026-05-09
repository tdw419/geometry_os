; DESCRIPTION: Places a green line segment connecting (146, 191) to (95, 181).
; PLAN: r0=146(x1), r1=191(y1), r2=95(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 191
LDI r2, 95
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
