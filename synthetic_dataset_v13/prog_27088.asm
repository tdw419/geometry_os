; DESCRIPTION: Draws a black line from (333, 44) to (207, 15).
; PLAN: r0=333(x1), r1=44(y1), r2=207(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 44
LDI r2, 207
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
