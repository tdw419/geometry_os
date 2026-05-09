; DESCRIPTION: Places a white line segment connecting (21, 249) to (76, 71).
; PLAN: r0=21(x1), r1=249(y1), r2=76(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 249
LDI r2, 76
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
