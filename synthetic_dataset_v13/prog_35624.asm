; DESCRIPTION: Places a black line segment connecting (340, 43) to (38, 125).
; PLAN: r0=340(x1), r1=43(y1), r2=38(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 43
LDI r2, 38
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
