; DESCRIPTION: Draws a green line from (210, 221) to (472, 203).
; PLAN: r0=210(x1), r1=221(y1), r2=472(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 221
LDI r2, 472
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
