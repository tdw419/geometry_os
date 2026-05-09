; DESCRIPTION: Draws a green line from (425, 179) to (442, 160).
; PLAN: r0=425(x1), r1=179(y1), r2=442(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 179
LDI r2, 442
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
