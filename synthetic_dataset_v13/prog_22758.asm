; DESCRIPTION: Renders a red line between points (235, 209) and (75, 161).
; PLAN: r0=235(x1), r1=209(y1), r2=75(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 209
LDI r2, 75
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
