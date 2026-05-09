; DESCRIPTION: Draws a yellow line from (403, 63) to (485, 103).
; PLAN: r0=403(x1), r1=63(y1), r2=485(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 63
LDI r2, 485
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
