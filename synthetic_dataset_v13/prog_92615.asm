; DESCRIPTION: Renders a yellow line between points (331, 223) and (180, 204).
; PLAN: r0=331(x1), r1=223(y1), r2=180(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 223
LDI r2, 180
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
