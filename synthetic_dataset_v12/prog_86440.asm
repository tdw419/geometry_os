; DESCRIPTION: Places a magenta line segment connecting (439, 26) to (255, 65).
; PLAN: r0=439(x1), r1=26(y1), r2=255(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 26
LDI r2, 255
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
