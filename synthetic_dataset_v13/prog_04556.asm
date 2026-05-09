; DESCRIPTION: Draws a purple line from (215, 165) to (48, 223).
; PLAN: r0=215(x1), r1=165(y1), r2=48(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 165
LDI r2, 48
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
