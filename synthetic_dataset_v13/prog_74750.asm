; DESCRIPTION: Places a cyan line segment connecting (78, 181) to (400, 37).
; PLAN: r0=78(x1), r1=181(y1), r2=400(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 181
LDI r2, 400
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
