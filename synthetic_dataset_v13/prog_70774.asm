; DESCRIPTION: Renders a magenta line between points (0, 164) and (183, 208).
; PLAN: r0=0(x1), r1=164(y1), r2=183(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 164
LDI r2, 183
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
