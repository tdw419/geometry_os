; DESCRIPTION: Renders a yellow line between points (246, 183) and (398, 235).
; PLAN: r0=246(x1), r1=183(y1), r2=398(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 183
LDI r2, 398
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
