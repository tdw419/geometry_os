; DESCRIPTION: Draws a black line from (223, 90) to (108, 146).
; PLAN: r0=223(x1), r1=90(y1), r2=108(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 90
LDI r2, 108
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
