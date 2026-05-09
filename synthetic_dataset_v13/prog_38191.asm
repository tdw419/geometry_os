; DESCRIPTION: Draws a black line from (446, 39) to (424, 25).
; PLAN: r0=446(x1), r1=39(y1), r2=424(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 39
LDI r2, 424
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
