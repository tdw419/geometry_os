; DESCRIPTION: Draws a black line from (54, 183) to (278, 231).
; PLAN: r0=54(x1), r1=183(y1), r2=278(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 183
LDI r2, 278
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
