; DESCRIPTION: Renders a yellow disk with center (146, 160) and radius 63.
; PLAN: r0=146(x), r1=160(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 160
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
