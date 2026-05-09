; DESCRIPTION: Renders a yellow line between points (39, 135) and (166, 246).
; PLAN: r0=39(x1), r1=135(y1), r2=166(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 135
LDI r2, 166
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
