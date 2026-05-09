; DESCRIPTION: Renders a blue disk with center (362, 208) and radius 42.
; PLAN: r0=362(x), r1=208(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 208
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
