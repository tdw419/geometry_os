; DESCRIPTION: Draws a black line from (313, 157) to (185, 215).
; PLAN: r0=313(x1), r1=157(y1), r2=185(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 157
LDI r2, 185
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
