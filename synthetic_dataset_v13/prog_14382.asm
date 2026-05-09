; DESCRIPTION: Renders a green disk with center (408, 151) and radius 59.
; PLAN: r0=408(x), r1=151(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 151
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
