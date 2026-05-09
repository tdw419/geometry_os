; DESCRIPTION: Draws a yellow line from (311, 122) to (446, 195).
; PLAN: r0=311(x1), r1=122(y1), r2=446(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 122
LDI r2, 446
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
