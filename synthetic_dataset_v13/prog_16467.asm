; DESCRIPTION: Places a cyan line segment connecting (400, 223) to (21, 72).
; PLAN: r0=400(x1), r1=223(y1), r2=21(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 223
LDI r2, 21
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
