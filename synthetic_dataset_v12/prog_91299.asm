; DESCRIPTION: Draws a black line from (243, 99) to (356, 74).
; PLAN: r0=243(x1), r1=99(y1), r2=356(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 99
LDI r2, 356
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
