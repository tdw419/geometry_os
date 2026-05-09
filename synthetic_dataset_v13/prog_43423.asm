; DESCRIPTION: Renders a green line between points (254, 31) and (17, 150).
; PLAN: r0=254(x1), r1=31(y1), r2=17(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 31
LDI r2, 17
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
