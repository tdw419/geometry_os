; DESCRIPTION: Renders a cyan line between points (456, 52) and (497, 95).
; PLAN: r0=456(x1), r1=52(y1), r2=497(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 52
LDI r2, 497
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
