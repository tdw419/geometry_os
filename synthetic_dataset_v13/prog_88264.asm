; DESCRIPTION: Renders a cyan line between points (30, 235) and (24, 70).
; PLAN: r0=30(x1), r1=235(y1), r2=24(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 235
LDI r2, 24
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
