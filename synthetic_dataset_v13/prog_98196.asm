; DESCRIPTION: Renders a blue disk with center (281, 223) and radius 10.
; PLAN: r0=281(x), r1=223(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 223
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
