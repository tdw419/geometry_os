; DESCRIPTION: Places a red line segment connecting (112, 231) to (263, 243).
; PLAN: r0=112(x1), r1=231(y1), r2=263(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 231
LDI r2, 263
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
