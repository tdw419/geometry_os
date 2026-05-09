; DESCRIPTION: Draws a orange line from (7, 116) to (446, 236).
; PLAN: r0=7(x1), r1=116(y1), r2=446(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 116
LDI r2, 446
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
