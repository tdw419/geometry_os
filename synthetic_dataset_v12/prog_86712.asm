; DESCRIPTION: Renders a cyan line between points (273, 184) and (232, 212).
; PLAN: r0=273(x1), r1=184(y1), r2=232(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 184
LDI r2, 232
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
