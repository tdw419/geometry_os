; DESCRIPTION: Draws a black line from (437, 139) to (327, 197).
; PLAN: r0=437(x1), r1=139(y1), r2=327(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 139
LDI r2, 327
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
