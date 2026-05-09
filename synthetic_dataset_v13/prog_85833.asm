; DESCRIPTION: Renders a red disk with center (180, 83) and radius 38.
; PLAN: r0=180(x), r1=83(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 83
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
