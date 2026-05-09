; DESCRIPTION: Renders a yellow line between points (455, 19) and (296, 89).
; PLAN: r0=455(x1), r1=19(y1), r2=296(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 19
LDI r2, 296
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
