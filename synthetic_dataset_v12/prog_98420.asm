; DESCRIPTION: Renders a magenta line between points (320, 19) and (116, 140).
; PLAN: r0=320(x1), r1=19(y1), r2=116(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 19
LDI r2, 116
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
