; DESCRIPTION: Draws a red line from (245, 111) to (421, 144).
; PLAN: r0=245(x1), r1=111(y1), r2=421(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 111
LDI r2, 421
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
