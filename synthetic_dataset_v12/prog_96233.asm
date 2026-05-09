; DESCRIPTION: Renders a yellow line between points (254, 18) and (153, 19).
; PLAN: r0=254(x1), r1=18(y1), r2=153(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 18
LDI r2, 153
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
