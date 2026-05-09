; DESCRIPTION: Places a red line segment connecting (9, 19) to (193, 27).
; PLAN: r0=9(x1), r1=19(y1), r2=193(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 19
LDI r2, 193
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
