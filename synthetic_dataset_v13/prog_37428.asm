; DESCRIPTION: Draws a purple line from (249, 246) to (215, 113).
; PLAN: r0=249(x1), r1=246(y1), r2=215(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 246
LDI r2, 215
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
