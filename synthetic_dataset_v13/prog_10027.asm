; DESCRIPTION: Draws a black line from (0, 106) to (433, 16).
; PLAN: r0=0(x1), r1=106(y1), r2=433(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 106
LDI r2, 433
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
