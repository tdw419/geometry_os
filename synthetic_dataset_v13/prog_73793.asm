; DESCRIPTION: Draws a green line from (150, 20) to (115, 211).
; PLAN: r0=150(x1), r1=20(y1), r2=115(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 20
LDI r2, 115
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
