; DESCRIPTION: Draws a green line from (121, 206) to (7, 230).
; PLAN: r0=121(x1), r1=206(y1), r2=7(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 206
LDI r2, 7
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
