; DESCRIPTION: Renders a red disk with center (269, 186) and radius 62.
; PLAN: r0=269(x), r1=186(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 186
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
