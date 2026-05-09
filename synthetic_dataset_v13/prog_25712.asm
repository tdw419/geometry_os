; DESCRIPTION: Renders a green line between points (285, 31) and (280, 100).
; PLAN: r0=285(x1), r1=31(y1), r2=280(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 31
LDI r2, 280
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
