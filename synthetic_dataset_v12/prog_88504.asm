; DESCRIPTION: Renders a red line between points (307, 159) and (277, 190).
; PLAN: r0=307(x1), r1=159(y1), r2=277(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 159
LDI r2, 277
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
