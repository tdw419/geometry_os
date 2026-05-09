; DESCRIPTION: Draws a orange line from (305, 209) to (176, 77).
; PLAN: r0=305(x1), r1=209(y1), r2=176(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 209
LDI r2, 176
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
