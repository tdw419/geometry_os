; DESCRIPTION: Places a orange line segment connecting (27, 209) to (373, 27).
; PLAN: r0=27(x1), r1=209(y1), r2=373(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 209
LDI r2, 373
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
