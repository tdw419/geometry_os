; DESCRIPTION: Draws a red line from (32, 13) to (161, 39).
; PLAN: r0=32(x1), r1=13(y1), r2=161(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 13
LDI r2, 161
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
