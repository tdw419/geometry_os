; DESCRIPTION: Renders a blue disk with center (286, 143) and radius 42.
; PLAN: r0=286(x), r1=143(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 143
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
