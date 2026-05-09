; DESCRIPTION: Draws a green line from (439, 68) to (145, 244).
; PLAN: r0=439(x1), r1=68(y1), r2=145(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 68
LDI r2, 145
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
