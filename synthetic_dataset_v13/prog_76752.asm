; DESCRIPTION: Places a orange line segment connecting (410, 19) to (186, 8).
; PLAN: r0=410(x1), r1=19(y1), r2=186(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 19
LDI r2, 186
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
