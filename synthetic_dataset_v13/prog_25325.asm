; DESCRIPTION: Renders a green disk with center (214, 91) and radius 77.
; PLAN: r0=214(x), r1=91(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 91
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
