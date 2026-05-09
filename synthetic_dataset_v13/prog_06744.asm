; DESCRIPTION: Places a cyan line segment connecting (462, 130) to (217, 232).
; PLAN: r0=462(x1), r1=130(y1), r2=217(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 130
LDI r2, 217
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
