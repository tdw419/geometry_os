; DESCRIPTION: Draws a black line from (43, 200) to (87, 202).
; PLAN: r0=43(x1), r1=200(y1), r2=87(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 200
LDI r2, 87
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
