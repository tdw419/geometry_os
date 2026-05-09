; DESCRIPTION: Places a red line segment connecting (220, 115) to (400, 16).
; PLAN: r0=220(x1), r1=115(y1), r2=400(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 115
LDI r2, 400
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
