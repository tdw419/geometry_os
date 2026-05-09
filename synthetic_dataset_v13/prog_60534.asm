; DESCRIPTION: Draws a orange line from (445, 4) to (243, 62).
; PLAN: r0=445(x1), r1=4(y1), r2=243(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 4
LDI r2, 243
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
