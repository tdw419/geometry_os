; DESCRIPTION: Places a cyan line segment connecting (293, 169) to (58, 160).
; PLAN: r0=293(x1), r1=169(y1), r2=58(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 169
LDI r2, 58
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
