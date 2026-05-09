; DESCRIPTION: Renders a red disk with center (79, 149) and radius 56.
; PLAN: r0=79(x), r1=149(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 149
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
