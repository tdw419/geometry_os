; DESCRIPTION: Places a white line segment connecting (411, 12) to (220, 202).
; PLAN: r0=411(x1), r1=12(y1), r2=220(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 12
LDI r2, 220
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
