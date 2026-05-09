; DESCRIPTION: Renders a blue disk with center (146, 153) and radius 36.
; PLAN: r0=146(x), r1=153(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 153
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
