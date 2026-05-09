; DESCRIPTION: Renders a green disk with center (146, 80) and radius 62.
; PLAN: r0=146(x), r1=80(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 80
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
