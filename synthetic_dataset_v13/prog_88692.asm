; DESCRIPTION: Renders a white line between points (332, 128) and (91, 17).
; PLAN: r0=332(x1), r1=128(y1), r2=91(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 128
LDI r2, 91
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
