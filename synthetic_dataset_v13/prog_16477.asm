; DESCRIPTION: Places a cyan line segment connecting (400, 90) to (181, 47).
; PLAN: r0=400(x1), r1=90(y1), r2=181(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 90
LDI r2, 181
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
