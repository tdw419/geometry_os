; DESCRIPTION: Renders a green disk with center (174, 156) and radius 68.
; PLAN: r0=174(x), r1=156(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 156
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
