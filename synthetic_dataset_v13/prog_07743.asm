; DESCRIPTION: Places a yellow line segment connecting (51, 239) to (153, 46).
; PLAN: r0=51(x1), r1=239(y1), r2=153(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 239
LDI r2, 153
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
