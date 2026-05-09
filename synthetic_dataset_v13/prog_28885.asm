; DESCRIPTION: Renders a green line between points (465, 131) and (235, 159).
; PLAN: r0=465(x1), r1=131(y1), r2=235(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 131
LDI r2, 235
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
