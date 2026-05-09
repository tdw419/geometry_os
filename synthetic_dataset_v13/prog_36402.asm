; DESCRIPTION: Draws a black line from (12, 55) to (445, 252).
; PLAN: r0=12(x1), r1=55(y1), r2=445(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 55
LDI r2, 445
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
