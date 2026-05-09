; DESCRIPTION: Renders a magenta line between points (355, 134) and (277, 213).
; PLAN: r0=355(x1), r1=134(y1), r2=277(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 134
LDI r2, 277
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
