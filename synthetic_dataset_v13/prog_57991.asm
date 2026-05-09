; DESCRIPTION: Places a green line segment connecting (93, 70) to (126, 164).
; PLAN: r0=93(x1), r1=70(y1), r2=126(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 70
LDI r2, 126
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
