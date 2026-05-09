; DESCRIPTION: Draws a black line from (69, 78) to (259, 126).
; PLAN: r0=69(x1), r1=78(y1), r2=259(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 78
LDI r2, 259
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
