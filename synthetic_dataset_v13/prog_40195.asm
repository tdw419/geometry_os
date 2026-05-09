; DESCRIPTION: Renders a magenta line between points (391, 14) and (492, 246).
; PLAN: r0=391(x1), r1=14(y1), r2=492(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 14
LDI r2, 492
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
