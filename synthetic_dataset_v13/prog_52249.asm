; DESCRIPTION: Draws a green line from (17, 67) to (338, 200).
; PLAN: r0=17(x1), r1=67(y1), r2=338(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 67
LDI r2, 338
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
