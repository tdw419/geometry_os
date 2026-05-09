; DESCRIPTION: Draws a black line from (437, 48) to (34, 209).
; PLAN: r0=437(x1), r1=48(y1), r2=34(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 48
LDI r2, 34
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
