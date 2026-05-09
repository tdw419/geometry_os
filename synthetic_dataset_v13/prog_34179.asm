; DESCRIPTION: Places a white line segment connecting (111, 36) to (229, 71).
; PLAN: r0=111(x1), r1=36(y1), r2=229(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 36
LDI r2, 229
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
