; DESCRIPTION: Places a yellow line segment connecting (346, 2) to (329, 75).
; PLAN: r0=346(x1), r1=2(y1), r2=329(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 2
LDI r2, 329
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
