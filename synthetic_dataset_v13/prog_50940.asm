; DESCRIPTION: Renders a green line between points (239, 18) and (388, 40).
; PLAN: r0=239(x1), r1=18(y1), r2=388(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 18
LDI r2, 388
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
