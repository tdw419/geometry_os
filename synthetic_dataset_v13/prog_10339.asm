; DESCRIPTION: Draws a black line from (406, 24) to (504, 233).
; PLAN: r0=406(x1), r1=24(y1), r2=504(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 24
LDI r2, 504
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
