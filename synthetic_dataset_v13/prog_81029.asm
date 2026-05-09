; DESCRIPTION: Draws a black line from (362, 154) to (338, 5).
; PLAN: r0=362(x1), r1=154(y1), r2=338(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 154
LDI r2, 338
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
