; DESCRIPTION: Renders a magenta line between points (269, 186) and (359, 174).
; PLAN: r0=269(x1), r1=186(y1), r2=359(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 186
LDI r2, 359
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
