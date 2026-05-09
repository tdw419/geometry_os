; DESCRIPTION: Renders a yellow disk with center (392, 54) and radius 36.
; PLAN: r0=392(x), r1=54(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 54
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
