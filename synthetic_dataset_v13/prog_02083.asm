; DESCRIPTION: Draws a black line from (446, 233) to (101, 142).
; PLAN: r0=446(x1), r1=233(y1), r2=101(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 233
LDI r2, 101
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
