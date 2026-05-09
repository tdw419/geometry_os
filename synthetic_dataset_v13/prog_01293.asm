; DESCRIPTION: Renders a yellow line between points (168, 113) and (306, 208).
; PLAN: r0=168(x1), r1=113(y1), r2=306(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 113
LDI r2, 306
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
