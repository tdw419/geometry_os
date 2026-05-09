; DESCRIPTION: Draws a green line from (15, 243) to (239, 121).
; PLAN: r0=15(x1), r1=243(y1), r2=239(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 243
LDI r2, 239
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
