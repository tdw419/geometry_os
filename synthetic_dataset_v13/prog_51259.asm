; DESCRIPTION: Renders a green line between points (296, 125) and (64, 188).
; PLAN: r0=296(x1), r1=125(y1), r2=64(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 125
LDI r2, 64
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
