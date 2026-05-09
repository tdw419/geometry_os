; DESCRIPTION: Renders a cyan line between points (357, 208) and (24, 116).
; PLAN: r0=357(x1), r1=208(y1), r2=24(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 208
LDI r2, 24
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
