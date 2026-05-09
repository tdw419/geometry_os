; DESCRIPTION: Draws a green line from (300, 106) to (328, 3).
; PLAN: r0=300(x1), r1=106(y1), r2=328(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 106
LDI r2, 328
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
