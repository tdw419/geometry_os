; DESCRIPTION: Draws a black line from (442, 239) to (354, 227).
; PLAN: r0=442(x1), r1=239(y1), r2=354(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 239
LDI r2, 354
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
