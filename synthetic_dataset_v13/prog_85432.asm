; DESCRIPTION: Draws a green line from (173, 210) to (266, 2).
; PLAN: r0=173(x1), r1=210(y1), r2=266(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 210
LDI r2, 266
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
