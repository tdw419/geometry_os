; DESCRIPTION: Renders a magenta line between points (5, 9) and (413, 190).
; PLAN: r0=5(x1), r1=9(y1), r2=413(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 9
LDI r2, 413
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
