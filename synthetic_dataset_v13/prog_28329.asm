; DESCRIPTION: Places a green line segment connecting (328, 174) to (220, 3).
; PLAN: r0=328(x1), r1=174(y1), r2=220(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 174
LDI r2, 220
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
