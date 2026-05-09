; DESCRIPTION: Renders a orange line between points (474, 198) and (202, 27).
; PLAN: r0=474(x1), r1=198(y1), r2=202(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 198
LDI r2, 202
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
