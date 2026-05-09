; DESCRIPTION: Draws a black line from (225, 206) to (107, 121).
; PLAN: r0=225(x1), r1=206(y1), r2=107(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 206
LDI r2, 107
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
