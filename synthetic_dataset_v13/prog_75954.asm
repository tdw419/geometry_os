; DESCRIPTION: Renders a magenta line between points (270, 164) and (510, 52).
; PLAN: r0=270(x1), r1=164(y1), r2=510(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 164
LDI r2, 510
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
