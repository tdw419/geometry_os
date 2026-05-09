; DESCRIPTION: Renders a yellow line between points (304, 135) and (383, 190).
; PLAN: r0=304(x1), r1=135(y1), r2=383(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 135
LDI r2, 383
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
