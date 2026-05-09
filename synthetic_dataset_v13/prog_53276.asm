; DESCRIPTION: Places a cyan line segment connecting (270, 130) to (272, 250).
; PLAN: r0=270(x1), r1=130(y1), r2=272(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 130
LDI r2, 272
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
