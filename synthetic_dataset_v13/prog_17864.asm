; DESCRIPTION: Places a green line segment connecting (247, 115) to (146, 58).
; PLAN: r0=247(x1), r1=115(y1), r2=146(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 115
LDI r2, 146
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
