; DESCRIPTION: Draws a green line from (368, 23) to (474, 96).
; PLAN: r0=368(x1), r1=23(y1), r2=474(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 23
LDI r2, 474
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
