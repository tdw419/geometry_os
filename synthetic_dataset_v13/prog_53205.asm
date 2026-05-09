; DESCRIPTION: Places a blue line segment connecting (281, 4) to (398, 202).
; PLAN: r0=281(x1), r1=4(y1), r2=398(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 4
LDI r2, 398
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
