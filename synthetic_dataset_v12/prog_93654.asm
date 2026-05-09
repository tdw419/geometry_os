; DESCRIPTION: Draws a orange line from (420, 36) to (269, 117).
; PLAN: r0=420(x1), r1=36(y1), r2=269(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 36
LDI r2, 269
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
