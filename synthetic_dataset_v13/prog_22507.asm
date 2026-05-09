; DESCRIPTION: Renders a magenta line between points (129, 185) and (298, 95).
; PLAN: r0=129(x1), r1=185(y1), r2=298(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 185
LDI r2, 298
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
