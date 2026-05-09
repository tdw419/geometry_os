; DESCRIPTION: Draws a red line from (271, 24) to (239, 163).
; PLAN: r0=271(x1), r1=24(y1), r2=239(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 24
LDI r2, 239
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
