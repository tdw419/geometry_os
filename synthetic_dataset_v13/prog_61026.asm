; DESCRIPTION: Draws a orange line from (295, 48) to (12, 234).
; PLAN: r0=295(x1), r1=48(y1), r2=12(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 48
LDI r2, 12
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
