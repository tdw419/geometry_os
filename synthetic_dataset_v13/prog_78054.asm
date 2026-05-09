; DESCRIPTION: Draws a purple line from (377, 27) to (384, 134).
; PLAN: r0=377(x1), r1=27(y1), r2=384(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 27
LDI r2, 384
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
