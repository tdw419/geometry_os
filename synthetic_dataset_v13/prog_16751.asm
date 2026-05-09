; DESCRIPTION: Draws a black line from (275, 176) to (233, 7).
; PLAN: r0=275(x1), r1=176(y1), r2=233(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 176
LDI r2, 233
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
