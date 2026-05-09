; DESCRIPTION: Renders a magenta line between points (415, 179) and (321, 200).
; PLAN: r0=415(x1), r1=179(y1), r2=321(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 179
LDI r2, 321
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
