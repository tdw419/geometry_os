; DESCRIPTION: Renders a cyan line between points (509, 212) and (311, 219).
; PLAN: r0=509(x1), r1=212(y1), r2=311(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 212
LDI r2, 311
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
