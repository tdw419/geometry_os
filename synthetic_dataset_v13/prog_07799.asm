; DESCRIPTION: Draws a green line from (60, 84) to (291, 239).
; PLAN: r0=60(x1), r1=84(y1), r2=291(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 84
LDI r2, 291
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
