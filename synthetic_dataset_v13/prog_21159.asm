; DESCRIPTION: Places a yellow line segment connecting (475, 186) to (467, 236).
; PLAN: r0=475(x1), r1=186(y1), r2=467(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 186
LDI r2, 467
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
