; DESCRIPTION: Draws a red line from (472, 243) to (255, 44).
; PLAN: r0=472(x1), r1=243(y1), r2=255(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 243
LDI r2, 255
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
