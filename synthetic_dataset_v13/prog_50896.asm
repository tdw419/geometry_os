; DESCRIPTION: Renders a green line between points (229, 213) and (261, 136).
; PLAN: r0=229(x1), r1=213(y1), r2=261(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 213
LDI r2, 261
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
