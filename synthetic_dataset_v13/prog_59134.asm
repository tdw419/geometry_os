; DESCRIPTION: Renders a red line between points (294, 216) and (411, 192).
; PLAN: r0=294(x1), r1=216(y1), r2=411(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 216
LDI r2, 411
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
