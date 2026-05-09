; DESCRIPTION: Draws a orange line from (255, 40) to (394, 92).
; PLAN: r0=255(x1), r1=40(y1), r2=394(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 40
LDI r2, 394
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
