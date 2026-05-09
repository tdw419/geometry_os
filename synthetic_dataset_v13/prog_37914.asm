; DESCRIPTION: Renders a yellow disk with center (248, 146) and radius 57.
; PLAN: r0=248(x), r1=146(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 146
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
