; DESCRIPTION: Renders a yellow disk with center (243, 91) and radius 63.
; PLAN: r0=243(x), r1=91(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 91
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
