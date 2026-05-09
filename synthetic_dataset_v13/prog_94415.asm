; DESCRIPTION: Renders a red line between points (228, 190) and (125, 222).
; PLAN: r0=228(x1), r1=190(y1), r2=125(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 190
LDI r2, 125
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
