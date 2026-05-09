; DESCRIPTION: Renders a magenta line between points (410, 190) and (176, 131).
; PLAN: r0=410(x1), r1=190(y1), r2=176(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 190
LDI r2, 176
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
