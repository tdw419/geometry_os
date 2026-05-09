; DESCRIPTION: Places a red line segment connecting (27, 3) to (35, 196).
; PLAN: r0=27(x1), r1=3(y1), r2=35(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 3
LDI r2, 35
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
