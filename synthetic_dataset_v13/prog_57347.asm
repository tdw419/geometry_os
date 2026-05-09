; DESCRIPTION: Draws a purple line from (479, 33) to (288, 243).
; PLAN: r0=479(x1), r1=33(y1), r2=288(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 33
LDI r2, 288
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
