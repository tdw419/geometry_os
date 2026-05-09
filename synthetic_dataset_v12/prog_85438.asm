; DESCRIPTION: Draws a black line from (179, 95) to (281, 184).
; PLAN: r0=179(x1), r1=95(y1), r2=281(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 95
LDI r2, 281
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
