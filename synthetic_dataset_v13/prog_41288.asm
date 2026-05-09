; DESCRIPTION: Places a magenta line segment connecting (244, 216) to (394, 235).
; PLAN: r0=244(x1), r1=216(y1), r2=394(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 216
LDI r2, 394
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
