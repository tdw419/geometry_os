; DESCRIPTION: Places a green line segment connecting (486, 32) to (71, 76).
; PLAN: r0=486(x1), r1=32(y1), r2=71(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 32
LDI r2, 71
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
