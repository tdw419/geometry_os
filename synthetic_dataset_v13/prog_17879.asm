; DESCRIPTION: Renders a magenta line between points (346, 132) and (95, 124).
; PLAN: r0=346(x1), r1=132(y1), r2=95(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 132
LDI r2, 95
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
