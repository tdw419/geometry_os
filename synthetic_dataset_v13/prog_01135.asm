; DESCRIPTION: Renders a red disk with center (228, 145) and radius 25.
; PLAN: r0=228(x), r1=145(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 145
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
