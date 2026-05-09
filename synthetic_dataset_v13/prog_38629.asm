; DESCRIPTION: Places a red line segment connecting (386, 153) to (22, 160).
; PLAN: r0=386(x1), r1=153(y1), r2=22(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 153
LDI r2, 22
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
