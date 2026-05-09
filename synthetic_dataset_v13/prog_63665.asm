; DESCRIPTION: Draws a green line from (150, 200) to (230, 26).
; PLAN: r0=150(x1), r1=200(y1), r2=230(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 200
LDI r2, 230
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
