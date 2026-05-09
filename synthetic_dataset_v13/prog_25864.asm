; DESCRIPTION: Draws a green line from (270, 150) to (231, 132).
; PLAN: r0=270(x1), r1=150(y1), r2=231(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 150
LDI r2, 231
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
