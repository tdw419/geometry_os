; DESCRIPTION: Renders a green line between points (60, 253) and (235, 207).
; PLAN: r0=60(x1), r1=253(y1), r2=235(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 253
LDI r2, 235
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
