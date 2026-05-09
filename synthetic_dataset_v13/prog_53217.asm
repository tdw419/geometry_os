; DESCRIPTION: Draws a green line from (431, 85) to (415, 63).
; PLAN: r0=431(x1), r1=85(y1), r2=415(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 85
LDI r2, 415
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
