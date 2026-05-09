; DESCRIPTION: Renders a red disk with center (27, 228) and radius 12.
; PLAN: r0=27(x), r1=228(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 228
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
