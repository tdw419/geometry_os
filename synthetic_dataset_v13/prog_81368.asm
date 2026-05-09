; DESCRIPTION: Renders a blue line between points (236, 177) and (154, 186).
; PLAN: r0=236(x1), r1=177(y1), r2=154(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 177
LDI r2, 154
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
