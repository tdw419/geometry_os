; DESCRIPTION: Renders a green line between points (205, 206) and (235, 93).
; PLAN: r0=205(x1), r1=206(y1), r2=235(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 206
LDI r2, 235
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
