; DESCRIPTION: Draws a orange line from (482, 245) to (215, 79).
; PLAN: r0=482(x1), r1=245(y1), r2=215(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 245
LDI r2, 215
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
