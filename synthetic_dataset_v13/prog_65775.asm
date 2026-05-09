; DESCRIPTION: Places a green line segment connecting (218, 231) to (115, 235).
; PLAN: r0=218(x1), r1=231(y1), r2=115(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 231
LDI r2, 115
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
