; DESCRIPTION: Draws a black line from (406, 110) to (42, 145).
; PLAN: r0=406(x1), r1=110(y1), r2=42(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 110
LDI r2, 42
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
