; DESCRIPTION: Draws a blue line from (306, 32) to (424, 213).
; PLAN: r0=306(x1), r1=32(y1), r2=424(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 32
LDI r2, 424
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
