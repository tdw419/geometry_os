; DESCRIPTION: Draws a red line from (370, 119) to (32, 174).
; PLAN: r0=370(x1), r1=119(y1), r2=32(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 119
LDI r2, 32
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
