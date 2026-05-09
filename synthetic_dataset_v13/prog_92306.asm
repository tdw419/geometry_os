; DESCRIPTION: Draws a orange line from (218, 37) to (403, 113).
; PLAN: r0=218(x1), r1=37(y1), r2=403(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 37
LDI r2, 403
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
