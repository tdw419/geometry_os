; DESCRIPTION: Places a cyan line segment connecting (260, 22) to (388, 24).
; PLAN: r0=260(x1), r1=22(y1), r2=388(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 22
LDI r2, 388
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
