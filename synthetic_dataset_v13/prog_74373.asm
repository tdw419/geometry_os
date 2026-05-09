; DESCRIPTION: Draws a black line from (504, 105) to (40, 27).
; PLAN: r0=504(x1), r1=105(y1), r2=40(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 105
LDI r2, 40
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
