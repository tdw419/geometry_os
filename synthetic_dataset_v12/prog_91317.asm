; DESCRIPTION: Draws a yellow line from (243, 239) to (125, 88).
; PLAN: r0=243(x1), r1=239(y1), r2=125(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 239
LDI r2, 125
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
