; DESCRIPTION: Draws a black line from (121, 234) to (90, 120).
; PLAN: r0=121(x1), r1=234(y1), r2=90(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 234
LDI r2, 90
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
