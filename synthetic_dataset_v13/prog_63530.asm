; DESCRIPTION: Places a green line segment connecting (126, 103) to (324, 40).
; PLAN: r0=126(x1), r1=103(y1), r2=324(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 103
LDI r2, 324
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
