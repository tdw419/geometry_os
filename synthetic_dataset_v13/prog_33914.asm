; DESCRIPTION: Draws a black line from (27, 49) to (458, 240).
; PLAN: r0=27(x1), r1=49(y1), r2=458(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 49
LDI r2, 458
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
