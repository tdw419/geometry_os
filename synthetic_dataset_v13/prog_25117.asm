; DESCRIPTION: Draws a yellow line from (306, 239) to (33, 45).
; PLAN: r0=306(x1), r1=239(y1), r2=33(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 239
LDI r2, 33
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
