; DESCRIPTION: Renders a blue line between points (162, 111) and (113, 190).
; PLAN: r0=162(x1), r1=111(y1), r2=113(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 111
LDI r2, 113
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
