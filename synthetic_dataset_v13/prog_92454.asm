; DESCRIPTION: Renders a green disk with center (428, 71) and radius 47.
; PLAN: r0=428(x), r1=71(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 71
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
