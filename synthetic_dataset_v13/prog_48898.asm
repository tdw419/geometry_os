; DESCRIPTION: Places a green line segment connecting (28, 7) to (434, 70).
; PLAN: r0=28(x1), r1=7(y1), r2=434(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 7
LDI r2, 434
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
