; DESCRIPTION: Draws a black line from (178, 153) to (166, 70).
; PLAN: r0=178(x1), r1=153(y1), r2=166(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 153
LDI r2, 166
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
