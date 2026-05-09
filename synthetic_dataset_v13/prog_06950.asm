; DESCRIPTION: Draws a black line from (72, 57) to (52, 171).
; PLAN: r0=72(x1), r1=57(y1), r2=52(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 57
LDI r2, 52
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
