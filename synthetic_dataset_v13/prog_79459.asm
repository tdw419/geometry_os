; DESCRIPTION: Places a white line segment connecting (260, 68) to (300, 193).
; PLAN: r0=260(x1), r1=68(y1), r2=300(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 68
LDI r2, 300
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
