; DESCRIPTION: Draws a black line from (431, 239) to (161, 196).
; PLAN: r0=431(x1), r1=239(y1), r2=161(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 239
LDI r2, 161
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
