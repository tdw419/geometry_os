; DESCRIPTION: Renders a green line between points (362, 145) and (373, 33).
; PLAN: r0=362(x1), r1=145(y1), r2=373(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 145
LDI r2, 373
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
