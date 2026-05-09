; DESCRIPTION: Draws a black line from (197, 45) to (313, 64).
; PLAN: r0=197(x1), r1=45(y1), r2=313(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 45
LDI r2, 313
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
