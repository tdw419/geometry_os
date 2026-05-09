; DESCRIPTION: Places a red line segment connecting (4, 141) to (32, 196).
; PLAN: r0=4(x1), r1=141(y1), r2=32(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 141
LDI r2, 32
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
