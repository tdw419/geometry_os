; DESCRIPTION: Renders a purple line between points (387, 226) and (281, 55).
; PLAN: r0=387(x1), r1=226(y1), r2=281(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 226
LDI r2, 281
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
