; DESCRIPTION: Renders a purple line between points (281, 229) and (215, 84).
; PLAN: r0=281(x1), r1=229(y1), r2=215(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 229
LDI r2, 215
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
