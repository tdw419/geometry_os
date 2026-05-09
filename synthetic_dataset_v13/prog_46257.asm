; DESCRIPTION: Renders a black line between points (319, 36) and (206, 197).
; PLAN: r0=319(x1), r1=36(y1), r2=206(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 36
LDI r2, 206
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
