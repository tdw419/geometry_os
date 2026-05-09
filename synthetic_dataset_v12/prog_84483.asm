; DESCRIPTION: Draws a yellow line from (213, 76) to (39, 63).
; PLAN: r0=213(x1), r1=76(y1), r2=39(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 76
LDI r2, 39
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
