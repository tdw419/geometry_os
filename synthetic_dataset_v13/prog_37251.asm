; DESCRIPTION: Renders a green line between points (262, 210) and (296, 191).
; PLAN: r0=262(x1), r1=210(y1), r2=296(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 210
LDI r2, 296
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
