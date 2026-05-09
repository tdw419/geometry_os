; DESCRIPTION: Renders a green line between points (215, 185) and (172, 237).
; PLAN: r0=215(x1), r1=185(y1), r2=172(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 185
LDI r2, 172
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
