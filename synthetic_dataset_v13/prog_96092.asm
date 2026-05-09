; DESCRIPTION: Renders a cyan line between points (506, 208) and (296, 66).
; PLAN: r0=506(x1), r1=208(y1), r2=296(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 208
LDI r2, 296
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
