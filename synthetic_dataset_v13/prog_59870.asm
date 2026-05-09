; DESCRIPTION: Renders a red line between points (479, 106) and (70, 227).
; PLAN: r0=479(x1), r1=106(y1), r2=70(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 106
LDI r2, 70
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
