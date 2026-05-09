; DESCRIPTION: Places a magenta line segment connecting (442, 76) to (405, 231).
; PLAN: r0=442(x1), r1=76(y1), r2=405(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 76
LDI r2, 405
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
