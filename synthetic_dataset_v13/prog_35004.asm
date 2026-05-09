; DESCRIPTION: Draws a red line from (48, 115) to (438, 138).
; PLAN: r0=48(x1), r1=115(y1), r2=438(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 115
LDI r2, 438
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
