; DESCRIPTION: Draws a black line from (463, 59) to (239, 200).
; PLAN: r0=463(x1), r1=59(y1), r2=239(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 59
LDI r2, 239
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
