; DESCRIPTION: Renders a magenta line between points (204, 46) and (174, 171).
; PLAN: r0=204(x1), r1=46(y1), r2=174(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 46
LDI r2, 174
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
