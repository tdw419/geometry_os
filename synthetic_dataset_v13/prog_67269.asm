; DESCRIPTION: Draws a black line from (189, 68) to (57, 162).
; PLAN: r0=189(x1), r1=68(y1), r2=57(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 68
LDI r2, 57
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
