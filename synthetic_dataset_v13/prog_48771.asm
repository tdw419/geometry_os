; DESCRIPTION: Renders a magenta line between points (182, 32) and (204, 194).
; PLAN: r0=182(x1), r1=32(y1), r2=204(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 32
LDI r2, 204
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
