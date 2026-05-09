; DESCRIPTION: Draws a green line from (338, 209) to (170, 74).
; PLAN: r0=338(x1), r1=209(y1), r2=170(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 209
LDI r2, 170
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
