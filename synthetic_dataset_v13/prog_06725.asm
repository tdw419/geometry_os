; DESCRIPTION: Renders a magenta line between points (467, 19) and (296, 14).
; PLAN: r0=467(x1), r1=19(y1), r2=296(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 19
LDI r2, 296
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
