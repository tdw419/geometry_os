; DESCRIPTION: Draws a black line from (11, 200) to (346, 126).
; PLAN: r0=11(x1), r1=200(y1), r2=346(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 200
LDI r2, 346
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
