; DESCRIPTION: Renders a magenta line between points (467, 243) and (363, 223).
; PLAN: r0=467(x1), r1=243(y1), r2=363(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 243
LDI r2, 363
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
