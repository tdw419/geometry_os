; DESCRIPTION: Renders a magenta line between points (330, 201) and (202, 221).
; PLAN: r0=330(x1), r1=201(y1), r2=202(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 201
LDI r2, 202
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
