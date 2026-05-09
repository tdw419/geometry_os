; DESCRIPTION: Draws a black line from (354, 154) to (348, 197).
; PLAN: r0=354(x1), r1=154(y1), r2=348(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 154
LDI r2, 348
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
