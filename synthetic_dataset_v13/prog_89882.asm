; DESCRIPTION: Renders a red line between points (423, 131) and (479, 190).
; PLAN: r0=423(x1), r1=131(y1), r2=479(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 131
LDI r2, 479
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
