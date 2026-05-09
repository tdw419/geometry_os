; DESCRIPTION: Renders a purple line between points (107, 9) and (215, 125).
; PLAN: r0=107(x1), r1=9(y1), r2=215(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 9
LDI r2, 215
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
