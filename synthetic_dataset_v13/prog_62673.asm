; DESCRIPTION: Renders a magenta line between points (415, 73) and (127, 186).
; PLAN: r0=415(x1), r1=73(y1), r2=127(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 73
LDI r2, 127
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
