; DESCRIPTION: Draws a yellow line from (510, 132) to (87, 91).
; PLAN: r0=510(x1), r1=132(y1), r2=87(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 132
LDI r2, 87
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
