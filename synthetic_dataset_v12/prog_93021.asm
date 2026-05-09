; DESCRIPTION: Renders a magenta disk with center (444, 186) and radius 25.
; PLAN: r0=444(x), r1=186(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 186
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
