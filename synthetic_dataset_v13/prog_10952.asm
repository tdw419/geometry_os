; DESCRIPTION: Places a green line segment connecting (170, 98) to (216, 143).
; PLAN: r0=170(x1), r1=98(y1), r2=216(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 98
LDI r2, 216
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
