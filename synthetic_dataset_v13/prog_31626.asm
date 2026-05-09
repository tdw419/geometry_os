; DESCRIPTION: Renders a magenta line between points (293, 129) and (4, 60).
; PLAN: r0=293(x1), r1=129(y1), r2=4(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 129
LDI r2, 4
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
