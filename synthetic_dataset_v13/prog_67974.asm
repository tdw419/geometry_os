; DESCRIPTION: Draws a black line from (303, 95) to (127, 18).
; PLAN: r0=303(x1), r1=95(y1), r2=127(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 95
LDI r2, 127
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
