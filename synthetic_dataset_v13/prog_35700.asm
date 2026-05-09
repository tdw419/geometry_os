; DESCRIPTION: Renders a magenta line between points (217, 48) and (330, 25).
; PLAN: r0=217(x1), r1=48(y1), r2=330(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 48
LDI r2, 330
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
