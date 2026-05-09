; DESCRIPTION: Draws a black line from (507, 37) to (196, 238).
; PLAN: r0=507(x1), r1=37(y1), r2=196(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 37
LDI r2, 196
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
