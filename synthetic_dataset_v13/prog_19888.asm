; DESCRIPTION: Renders a magenta line between points (417, 2) and (35, 215).
; PLAN: r0=417(x1), r1=2(y1), r2=35(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 2
LDI r2, 35
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
