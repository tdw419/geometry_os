; DESCRIPTION: Draws a green line from (209, 83) to (467, 89).
; PLAN: r0=209(x1), r1=83(y1), r2=467(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 83
LDI r2, 467
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
