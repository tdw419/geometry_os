; DESCRIPTION: Places a green line segment connecting (186, 187) to (146, 87).
; PLAN: r0=186(x1), r1=187(y1), r2=146(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 187
LDI r2, 146
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
