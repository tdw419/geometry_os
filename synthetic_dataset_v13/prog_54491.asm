; DESCRIPTION: Draws a blue line from (158, 210) to (384, 236).
; PLAN: r0=158(x1), r1=210(y1), r2=384(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 210
LDI r2, 384
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
