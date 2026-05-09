; DESCRIPTION: Renders a green line between points (409, 15) and (217, 221).
; PLAN: r0=409(x1), r1=15(y1), r2=217(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 15
LDI r2, 217
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
