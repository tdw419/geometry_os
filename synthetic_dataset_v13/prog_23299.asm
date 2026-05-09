; DESCRIPTION: Renders a red disk with center (347, 160) and radius 68.
; PLAN: r0=347(x), r1=160(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 160
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
