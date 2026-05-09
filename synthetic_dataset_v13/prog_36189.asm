; DESCRIPTION: Draws a black line from (53, 127) to (229, 126).
; PLAN: r0=53(x1), r1=127(y1), r2=229(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 127
LDI r2, 229
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
