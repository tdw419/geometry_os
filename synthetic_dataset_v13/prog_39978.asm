; DESCRIPTION: Places a white line segment connecting (197, 198) to (467, 49).
; PLAN: r0=197(x1), r1=198(y1), r2=467(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 198
LDI r2, 467
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
