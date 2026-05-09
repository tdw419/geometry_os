; DESCRIPTION: Renders a magenta line between points (356, 178) and (186, 202).
; PLAN: r0=356(x1), r1=178(y1), r2=186(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 178
LDI r2, 186
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
