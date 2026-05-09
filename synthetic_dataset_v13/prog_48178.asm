; DESCRIPTION: Draws a black line from (332, 248) to (362, 200).
; PLAN: r0=332(x1), r1=248(y1), r2=362(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 248
LDI r2, 362
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
