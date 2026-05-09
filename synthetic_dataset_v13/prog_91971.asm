; DESCRIPTION: Renders a red disk with center (180, 174) and radius 24.
; PLAN: r0=180(x), r1=174(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 174
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
