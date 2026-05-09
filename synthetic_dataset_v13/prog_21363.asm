; DESCRIPTION: Draws a black line from (248, 24) to (146, 43).
; PLAN: r0=248(x1), r1=24(y1), r2=146(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 24
LDI r2, 146
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
