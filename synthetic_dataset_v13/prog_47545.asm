; DESCRIPTION: Draws a orange line from (442, 215) to (46, 98).
; PLAN: r0=442(x1), r1=215(y1), r2=46(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 215
LDI r2, 46
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
