; DESCRIPTION: Renders a yellow line between points (246, 215) and (13, 18).
; PLAN: r0=246(x1), r1=215(y1), r2=13(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 215
LDI r2, 13
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
