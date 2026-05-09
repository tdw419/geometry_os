; DESCRIPTION: Draws a black line from (386, 9) to (82, 88).
; PLAN: r0=386(x1), r1=9(y1), r2=82(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 9
LDI r2, 82
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
