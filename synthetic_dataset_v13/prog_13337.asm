; DESCRIPTION: Draws a black line from (191, 63) to (511, 210).
; PLAN: r0=191(x1), r1=63(y1), r2=511(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 63
LDI r2, 511
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
