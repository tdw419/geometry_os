; DESCRIPTION: Draws a green line from (467, 25) to (110, 7).
; PLAN: r0=467(x1), r1=25(y1), r2=110(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 25
LDI r2, 110
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
