; DESCRIPTION: Renders a white line between points (160, 248) and (398, 232).
; PLAN: r0=160(x1), r1=248(y1), r2=398(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 248
LDI r2, 398
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
