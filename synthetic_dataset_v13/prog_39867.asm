; DESCRIPTION: Places a orange line segment connecting (280, 126) to (392, 106).
; PLAN: r0=280(x1), r1=126(y1), r2=392(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 126
LDI r2, 392
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
