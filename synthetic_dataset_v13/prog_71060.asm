; DESCRIPTION: Renders a magenta line between points (255, 174) and (356, 200).
; PLAN: r0=255(x1), r1=174(y1), r2=356(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 174
LDI r2, 356
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
