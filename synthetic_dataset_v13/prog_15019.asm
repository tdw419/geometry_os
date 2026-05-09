; DESCRIPTION: Renders a green line between points (277, 11) and (296, 246).
; PLAN: r0=277(x1), r1=11(y1), r2=296(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 11
LDI r2, 296
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
