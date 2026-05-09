; DESCRIPTION: Draws a green line from (288, 58) to (494, 58).
; PLAN: r0=288(x1), r1=58(y1), r2=494(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 58
LDI r2, 494
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
