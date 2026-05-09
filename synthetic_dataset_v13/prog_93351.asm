; DESCRIPTION: Places a green line segment connecting (277, 49) to (434, 30).
; PLAN: r0=277(x1), r1=49(y1), r2=434(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 49
LDI r2, 434
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
