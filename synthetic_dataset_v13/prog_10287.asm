; DESCRIPTION: Renders a green line between points (211, 205) and (65, 235).
; PLAN: r0=211(x1), r1=205(y1), r2=65(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 205
LDI r2, 65
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
