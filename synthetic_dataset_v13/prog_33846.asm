; DESCRIPTION: Renders a green line between points (86, 215) and (252, 230).
; PLAN: r0=86(x1), r1=215(y1), r2=252(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 215
LDI r2, 252
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
