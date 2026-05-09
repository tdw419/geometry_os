; DESCRIPTION: Draws a orange line from (32, 248) to (76, 125).
; PLAN: r0=32(x1), r1=248(y1), r2=76(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 248
LDI r2, 76
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
