; DESCRIPTION: Renders a purple line between points (38, 253) and (150, 215).
; PLAN: r0=38(x1), r1=253(y1), r2=150(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 253
LDI r2, 150
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
