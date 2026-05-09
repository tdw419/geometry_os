; DESCRIPTION: Renders a cyan line between points (265, 179) and (282, 70).
; PLAN: r0=265(x1), r1=179(y1), r2=282(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 179
LDI r2, 282
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
