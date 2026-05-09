; DESCRIPTION: Places a red line segment connecting (330, 240) to (367, 227).
; PLAN: r0=330(x1), r1=240(y1), r2=367(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 240
LDI r2, 367
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
