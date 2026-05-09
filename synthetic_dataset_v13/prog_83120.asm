; DESCRIPTION: Draws a black line from (26, 42) to (489, 187).
; PLAN: r0=26(x1), r1=42(y1), r2=489(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 42
LDI r2, 489
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
