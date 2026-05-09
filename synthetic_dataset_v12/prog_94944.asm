; DESCRIPTION: Renders a red line between points (242, 235) and (60, 81).
; PLAN: r0=242(x1), r1=235(y1), r2=60(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 235
LDI r2, 60
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
