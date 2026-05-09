; DESCRIPTION: Renders a green line between points (215, 246) and (227, 21).
; PLAN: r0=215(x1), r1=246(y1), r2=227(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 246
LDI r2, 227
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
