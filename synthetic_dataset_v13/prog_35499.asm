; DESCRIPTION: Places a green line segment connecting (230, 93) to (18, 11).
; PLAN: r0=230(x1), r1=93(y1), r2=18(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 93
LDI r2, 18
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
