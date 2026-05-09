; DESCRIPTION: Places a red line segment connecting (353, 103) to (52, 128).
; PLAN: r0=353(x1), r1=103(y1), r2=52(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 103
LDI r2, 52
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
