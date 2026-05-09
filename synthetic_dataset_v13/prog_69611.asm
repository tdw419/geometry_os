; DESCRIPTION: Places a red line segment connecting (392, 192) to (114, 10).
; PLAN: r0=392(x1), r1=192(y1), r2=114(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 192
LDI r2, 114
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
