; DESCRIPTION: Renders a magenta line between points (422, 197) and (277, 66).
; PLAN: r0=422(x1), r1=197(y1), r2=277(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 197
LDI r2, 277
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
