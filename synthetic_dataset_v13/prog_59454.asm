; DESCRIPTION: Draws a black line from (171, 63) to (179, 209).
; PLAN: r0=171(x1), r1=63(y1), r2=179(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 63
LDI r2, 179
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
