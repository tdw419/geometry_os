; DESCRIPTION: Draws a green line from (300, 30) to (132, 66).
; PLAN: r0=300(x1), r1=30(y1), r2=132(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 30
LDI r2, 132
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
