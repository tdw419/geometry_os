; DESCRIPTION: Renders a orange disk with center (168, 190) and radius 24.
; PLAN: r0=168(x), r1=190(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 190
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
