; DESCRIPTION: Draws a red line from (179, 243) to (406, 188).
; PLAN: r0=179(x1), r1=243(y1), r2=406(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 243
LDI r2, 406
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
