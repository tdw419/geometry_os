; DESCRIPTION: Renders a red line between points (317, 149) and (231, 190).
; PLAN: r0=317(x1), r1=149(y1), r2=231(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 149
LDI r2, 231
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
