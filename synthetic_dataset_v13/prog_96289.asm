; DESCRIPTION: Renders a yellow line between points (235, 158) and (479, 176).
; PLAN: r0=235(x1), r1=158(y1), r2=479(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 158
LDI r2, 479
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
