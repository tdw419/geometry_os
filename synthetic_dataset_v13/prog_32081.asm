; DESCRIPTION: Places a green line segment connecting (146, 49) to (128, 137).
; PLAN: r0=146(x1), r1=49(y1), r2=128(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 49
LDI r2, 128
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
