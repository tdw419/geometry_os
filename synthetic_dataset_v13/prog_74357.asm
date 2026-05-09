; DESCRIPTION: Places a green line segment connecting (331, 70) to (12, 27).
; PLAN: r0=331(x1), r1=70(y1), r2=12(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 70
LDI r2, 12
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
