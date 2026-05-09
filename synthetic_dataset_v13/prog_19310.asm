; DESCRIPTION: Draws a green line from (79, 57) to (87, 62).
; PLAN: r0=79(x1), r1=57(y1), r2=87(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 57
LDI r2, 87
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
