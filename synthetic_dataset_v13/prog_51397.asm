; DESCRIPTION: Renders a magenta line between points (77, 207) and (255, 214).
; PLAN: r0=77(x1), r1=207(y1), r2=255(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 207
LDI r2, 255
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
