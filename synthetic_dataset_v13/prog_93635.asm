; DESCRIPTION: Draws a black line from (452, 197) to (256, 180).
; PLAN: r0=452(x1), r1=197(y1), r2=256(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 197
LDI r2, 256
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
