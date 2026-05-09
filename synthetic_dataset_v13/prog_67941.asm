; DESCRIPTION: Draws a yellow line from (384, 135) to (488, 118).
; PLAN: r0=384(x1), r1=135(y1), r2=488(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 135
LDI r2, 488
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
