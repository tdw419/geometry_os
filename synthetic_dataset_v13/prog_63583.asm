; DESCRIPTION: Renders a green line between points (237, 213) and (316, 230).
; PLAN: r0=237(x1), r1=213(y1), r2=316(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 213
LDI r2, 316
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
