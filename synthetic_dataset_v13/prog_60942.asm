; DESCRIPTION: Draws a green line from (122, 230) to (239, 155).
; PLAN: r0=122(x1), r1=230(y1), r2=239(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 230
LDI r2, 239
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
