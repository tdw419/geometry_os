; DESCRIPTION: Draws a green line from (482, 108) to (198, 125).
; PLAN: r0=482(x1), r1=108(y1), r2=198(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 108
LDI r2, 198
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
