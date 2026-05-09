; DESCRIPTION: Draws a black line from (63, 21) to (178, 249).
; PLAN: r0=63(x1), r1=21(y1), r2=178(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 21
LDI r2, 178
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
