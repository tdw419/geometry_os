; DESCRIPTION: Places a red line segment connecting (210, 137) to (168, 25).
; PLAN: r0=210(x1), r1=137(y1), r2=168(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 137
LDI r2, 168
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
