; DESCRIPTION: Renders a cyan line between points (235, 88) and (206, 110).
; PLAN: r0=235(x1), r1=88(y1), r2=206(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 88
LDI r2, 206
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
