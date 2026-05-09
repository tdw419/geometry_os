; DESCRIPTION: Places a red line segment connecting (23, 32) to (125, 202).
; PLAN: r0=23(x1), r1=32(y1), r2=125(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 32
LDI r2, 125
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
