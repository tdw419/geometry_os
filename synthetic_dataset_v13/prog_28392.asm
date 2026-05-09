; DESCRIPTION: Draws a purple line from (488, 236) to (479, 158).
; PLAN: r0=488(x1), r1=236(y1), r2=479(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 236
LDI r2, 479
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
