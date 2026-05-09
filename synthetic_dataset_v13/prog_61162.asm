; DESCRIPTION: Draws a green line from (499, 49) to (214, 70).
; PLAN: r0=499(x1), r1=49(y1), r2=214(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 49
LDI r2, 214
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
