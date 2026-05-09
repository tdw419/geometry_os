; DESCRIPTION: Draws a yellow line from (293, 36) to (296, 12).
; PLAN: r0=293(x1), r1=36(y1), r2=296(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 36
LDI r2, 296
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
