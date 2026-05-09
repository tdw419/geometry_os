; DESCRIPTION: Renders a yellow disk with center (243, 68) and radius 54.
; PLAN: r0=243(x), r1=68(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 68
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
