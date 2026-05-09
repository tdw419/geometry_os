; DESCRIPTION: Renders a red disk with center (150, 202) and radius 21.
; PLAN: r0=150(x), r1=202(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 202
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
