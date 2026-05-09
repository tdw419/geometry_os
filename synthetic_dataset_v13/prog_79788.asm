; DESCRIPTION: Places a orange line segment connecting (298, 17) to (180, 75).
; PLAN: r0=298(x1), r1=17(y1), r2=180(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 17
LDI r2, 180
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
