; DESCRIPTION: Draws a blue line from (213, 249) to (306, 39).
; PLAN: r0=213(x1), r1=249(y1), r2=306(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 249
LDI r2, 306
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
