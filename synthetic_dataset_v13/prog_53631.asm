; DESCRIPTION: Draws a black line from (499, 126) to (338, 0).
; PLAN: r0=499(x1), r1=126(y1), r2=338(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 126
LDI r2, 338
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
