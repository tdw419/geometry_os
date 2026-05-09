; DESCRIPTION: Draws a black line from (198, 26) to (354, 246).
; PLAN: r0=198(x1), r1=26(y1), r2=354(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 26
LDI r2, 354
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
