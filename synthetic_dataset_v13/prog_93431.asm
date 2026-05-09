; DESCRIPTION: Places a red line segment connecting (191, 231) to (87, 161).
; PLAN: r0=191(x1), r1=231(y1), r2=87(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 231
LDI r2, 87
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
