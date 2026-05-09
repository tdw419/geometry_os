; DESCRIPTION: Draws a black line from (342, 125) to (272, 151).
; PLAN: r0=342(x1), r1=125(y1), r2=272(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 125
LDI r2, 272
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
