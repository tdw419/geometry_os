; DESCRIPTION: Places a orange line segment connecting (298, 124) to (265, 239).
; PLAN: r0=298(x1), r1=124(y1), r2=265(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 124
LDI r2, 265
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
