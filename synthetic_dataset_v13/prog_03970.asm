; DESCRIPTION: Draws a yellow line from (398, 239) to (353, 67).
; PLAN: r0=398(x1), r1=239(y1), r2=353(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 239
LDI r2, 353
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
