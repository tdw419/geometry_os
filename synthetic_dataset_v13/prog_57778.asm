; DESCRIPTION: Renders a purple line between points (113, 249) and (206, 132).
; PLAN: r0=113(x1), r1=249(y1), r2=206(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 249
LDI r2, 206
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
