; DESCRIPTION: Renders a magenta line between points (60, 204) and (213, 2).
; PLAN: r0=60(x1), r1=204(y1), r2=213(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 204
LDI r2, 213
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
