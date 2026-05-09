; DESCRIPTION: Draws a black line from (260, 38) to (150, 25).
; PLAN: r0=260(x1), r1=38(y1), r2=150(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 38
LDI r2, 150
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
