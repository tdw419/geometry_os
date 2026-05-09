; DESCRIPTION: Renders a white line between points (366, 230) and (138, 239).
; PLAN: r0=366(x1), r1=230(y1), r2=138(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 230
LDI r2, 138
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
