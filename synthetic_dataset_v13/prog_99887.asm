; DESCRIPTION: Renders a cyan line between points (245, 155) and (296, 141).
; PLAN: r0=245(x1), r1=155(y1), r2=296(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 155
LDI r2, 296
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
