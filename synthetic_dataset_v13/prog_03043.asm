; DESCRIPTION: Renders a yellow disk with center (180, 186) and radius 17.
; PLAN: r0=180(x), r1=186(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 186
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
