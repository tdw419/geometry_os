; DESCRIPTION: Renders a cyan line between points (232, 188) and (114, 241).
; PLAN: r0=232(x1), r1=188(y1), r2=114(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 188
LDI r2, 114
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
