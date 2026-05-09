; DESCRIPTION: Renders a magenta line between points (502, 182) and (68, 35).
; PLAN: r0=502(x1), r1=182(y1), r2=68(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 182
LDI r2, 68
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
