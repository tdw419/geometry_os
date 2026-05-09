; DESCRIPTION: Renders a orange line between points (235, 95) and (198, 27).
; PLAN: r0=235(x1), r1=95(y1), r2=198(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 95
LDI r2, 198
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
