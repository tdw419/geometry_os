; DESCRIPTION: Renders a red disk with center (179, 127) and radius 56.
; PLAN: r0=179(x), r1=127(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 127
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
