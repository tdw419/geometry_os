; DESCRIPTION: Draws a red line from (371, 248) to (23, 123).
; PLAN: r0=371(x1), r1=248(y1), r2=23(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 248
LDI r2, 23
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
