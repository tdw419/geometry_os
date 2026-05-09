; DESCRIPTION: Renders a red disk with center (173, 117) and radius 39.
; PLAN: r0=173(x), r1=117(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 117
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
