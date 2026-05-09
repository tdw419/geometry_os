; DESCRIPTION: Draws a orange line from (371, 239) to (156, 37).
; PLAN: r0=371(x1), r1=239(y1), r2=156(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 239
LDI r2, 156
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
