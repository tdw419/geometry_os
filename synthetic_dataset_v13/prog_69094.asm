; DESCRIPTION: Draws a yellow line from (464, 36) to (494, 12).
; PLAN: r0=464(x1), r1=36(y1), r2=494(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 36
LDI r2, 494
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
