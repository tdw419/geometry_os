; DESCRIPTION: Renders a yellow disk with center (370, 120) and radius 42.
; PLAN: r0=370(x), r1=120(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 120
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
