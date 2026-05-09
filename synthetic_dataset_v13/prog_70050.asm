; DESCRIPTION: Renders a green line between points (285, 44) and (362, 205).
; PLAN: r0=285(x1), r1=44(y1), r2=362(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 44
LDI r2, 362
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
