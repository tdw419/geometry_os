; DESCRIPTION: Draws a red line from (371, 125) to (457, 126).
; PLAN: r0=371(x1), r1=125(y1), r2=457(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 125
LDI r2, 457
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
