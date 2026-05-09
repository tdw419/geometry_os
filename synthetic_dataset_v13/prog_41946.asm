; DESCRIPTION: Draws a green line from (288, 102) to (182, 165).
; PLAN: r0=288(x1), r1=102(y1), r2=182(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 102
LDI r2, 182
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
