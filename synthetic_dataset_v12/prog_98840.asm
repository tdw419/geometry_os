; DESCRIPTION: Draws a blue line from (383, 176) to (213, 95).
; PLAN: r0=383(x1), r1=176(y1), r2=213(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 176
LDI r2, 213
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
