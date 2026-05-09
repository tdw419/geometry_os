; DESCRIPTION: Renders a magenta line between points (230, 233) and (131, 246).
; PLAN: r0=230(x1), r1=233(y1), r2=131(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 233
LDI r2, 131
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
