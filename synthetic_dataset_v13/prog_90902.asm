; DESCRIPTION: Draws a black line from (71, 196) to (135, 34).
; PLAN: r0=71(x1), r1=196(y1), r2=135(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 196
LDI r2, 135
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
