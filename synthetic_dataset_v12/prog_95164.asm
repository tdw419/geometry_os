; DESCRIPTION: Places a orange line segment connecting (59, 93) to (298, 252).
; PLAN: r0=59(x1), r1=93(y1), r2=298(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 93
LDI r2, 298
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
