; DESCRIPTION: Renders a green disk with center (220, 120) and radius 50.
; PLAN: r0=220(x), r1=120(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 120
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
