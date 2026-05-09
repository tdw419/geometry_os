; DESCRIPTION: Draws a magenta line from (233, 203) to (488, 226).
; PLAN: r0=233(x1), r1=203(y1), r2=488(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 203
LDI r2, 488
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
