; DESCRIPTION: Renders a blue line between points (305, 154) and (235, 205).
; PLAN: r0=305(x1), r1=154(y1), r2=235(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 154
LDI r2, 235
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
