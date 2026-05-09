; DESCRIPTION: Draws a purple line from (479, 222) to (93, 166).
; PLAN: r0=479(x1), r1=222(y1), r2=93(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 222
LDI r2, 93
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
