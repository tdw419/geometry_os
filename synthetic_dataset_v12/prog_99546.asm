; DESCRIPTION: Renders a red disk with center (238, 173) and radius 79.
; PLAN: r0=238(x), r1=173(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 173
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
