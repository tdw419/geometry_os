; DESCRIPTION: Draws a black line from (410, 72) to (424, 181).
; PLAN: r0=410(x1), r1=72(y1), r2=424(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 72
LDI r2, 424
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
