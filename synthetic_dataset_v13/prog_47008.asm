; DESCRIPTION: Draws a black line from (278, 165) to (510, 226).
; PLAN: r0=278(x1), r1=165(y1), r2=510(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 165
LDI r2, 510
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
