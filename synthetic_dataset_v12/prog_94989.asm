; DESCRIPTION: Draws a black line from (69, 32) to (130, 9).
; PLAN: r0=69(x1), r1=32(y1), r2=130(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 32
LDI r2, 130
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
