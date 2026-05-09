; DESCRIPTION: Renders a green line between points (447, 246) and (76, 108).
; PLAN: r0=447(x1), r1=246(y1), r2=76(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 246
LDI r2, 76
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
