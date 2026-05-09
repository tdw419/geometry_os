; DESCRIPTION: Draws a orange line from (510, 146) to (239, 11).
; PLAN: r0=510(x1), r1=146(y1), r2=239(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 146
LDI r2, 239
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
