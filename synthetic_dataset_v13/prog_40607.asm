; DESCRIPTION: Renders a red disk with center (370, 94) and radius 27.
; PLAN: r0=370(x), r1=94(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 94
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
