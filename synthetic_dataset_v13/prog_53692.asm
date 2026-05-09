; DESCRIPTION: Renders a yellow disk with center (146, 81) and radius 68.
; PLAN: r0=146(x), r1=81(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 81
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
