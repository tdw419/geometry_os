; DESCRIPTION: Renders a blue disk with center (346, 153) and radius 42.
; PLAN: r0=346(x), r1=153(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 153
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
