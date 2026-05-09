; DESCRIPTION: Renders a green line between points (358, 141) and (126, 43).
; PLAN: r0=358(x1), r1=141(y1), r2=126(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 141
LDI r2, 126
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
