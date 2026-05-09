; DESCRIPTION: Places a red line segment connecting (193, 193) to (393, 249).
; PLAN: r0=193(x1), r1=193(y1), r2=393(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 193
LDI r2, 393
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
