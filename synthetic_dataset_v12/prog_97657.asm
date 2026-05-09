; DESCRIPTION: Renders a magenta line between points (236, 221) and (112, 69).
; PLAN: r0=236(x1), r1=221(y1), r2=112(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 221
LDI r2, 112
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
