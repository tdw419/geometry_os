; DESCRIPTION: Places a green line segment connecting (145, 36) to (394, 223).
; PLAN: r0=145(x1), r1=36(y1), r2=394(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 36
LDI r2, 394
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
