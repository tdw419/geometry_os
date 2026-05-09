; DESCRIPTION: Renders a green line between points (12, 235) and (70, 177).
; PLAN: r0=12(x1), r1=235(y1), r2=70(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 235
LDI r2, 70
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
