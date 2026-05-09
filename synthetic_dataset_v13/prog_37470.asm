; DESCRIPTION: Draws a white line from (214, 84) to (245, 246).
; PLAN: r0=214(x1), r1=84(y1), r2=245(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 84
LDI r2, 245
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
