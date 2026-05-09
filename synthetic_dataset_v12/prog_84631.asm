; DESCRIPTION: Draws a black line from (214, 74) to (275, 127).
; PLAN: r0=214(x1), r1=74(y1), r2=275(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 74
LDI r2, 275
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
