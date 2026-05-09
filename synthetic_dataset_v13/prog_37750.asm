; DESCRIPTION: Draws a black line from (18, 32) to (352, 189).
; PLAN: r0=18(x1), r1=32(y1), r2=352(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 32
LDI r2, 352
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
