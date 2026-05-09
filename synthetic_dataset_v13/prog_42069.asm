; DESCRIPTION: Draws a black line from (239, 202) to (226, 89).
; PLAN: r0=239(x1), r1=202(y1), r2=226(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 202
LDI r2, 226
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
