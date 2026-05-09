; DESCRIPTION: Renders a green disk with center (162, 171) and radius 68.
; PLAN: r0=162(x), r1=171(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 171
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
