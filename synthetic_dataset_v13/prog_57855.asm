; DESCRIPTION: Renders a green line between points (144, 27) and (261, 48).
; PLAN: r0=144(x1), r1=27(y1), r2=261(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 27
LDI r2, 261
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
