; DESCRIPTION: Places a green line segment connecting (317, 126) to (14, 30).
; PLAN: r0=317(x1), r1=126(y1), r2=14(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 126
LDI r2, 14
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
