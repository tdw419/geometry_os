; DESCRIPTION: Renders a cyan line between points (432, 6) and (489, 239).
; PLAN: r0=432(x1), r1=6(y1), r2=489(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 6
LDI r2, 489
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
