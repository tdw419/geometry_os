; DESCRIPTION: Renders a white line between points (36, 65) and (61, 222).
; PLAN: r0=36(x1), r1=65(y1), r2=61(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 65
LDI r2, 61
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
