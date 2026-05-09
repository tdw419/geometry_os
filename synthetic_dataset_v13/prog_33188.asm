; DESCRIPTION: Renders a orange line between points (242, 235) and (240, 233).
; PLAN: r0=242(x1), r1=235(y1), r2=240(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 235
LDI r2, 240
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
