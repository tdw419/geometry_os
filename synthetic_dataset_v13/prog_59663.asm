; DESCRIPTION: Draws a purple line from (43, 213) to (488, 209).
; PLAN: r0=43(x1), r1=213(y1), r2=488(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 213
LDI r2, 488
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
