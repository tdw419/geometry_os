; DESCRIPTION: Renders a cyan line between points (329, 49) and (79, 100).
; PLAN: r0=329(x1), r1=49(y1), r2=79(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 49
LDI r2, 79
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
