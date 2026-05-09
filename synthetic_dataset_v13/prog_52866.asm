; DESCRIPTION: Draws a green line from (217, 219) to (403, 54).
; PLAN: r0=217(x1), r1=219(y1), r2=403(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 219
LDI r2, 403
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
