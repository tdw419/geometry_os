; DESCRIPTION: Renders a magenta line between points (294, 18) and (428, 90).
; PLAN: r0=294(x1), r1=18(y1), r2=428(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 18
LDI r2, 428
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
