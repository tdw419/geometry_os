; DESCRIPTION: Draws a blue line from (107, 37) to (467, 150).
; PLAN: r0=107(x1), r1=37(y1), r2=467(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 37
LDI r2, 467
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
