; DESCRIPTION: Draws a red line from (454, 249) to (57, 219).
; PLAN: r0=454(x1), r1=249(y1), r2=57(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 249
LDI r2, 57
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
