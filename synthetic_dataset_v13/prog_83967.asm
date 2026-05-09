; DESCRIPTION: Renders a red disk with center (480, 210) and radius 13.
; PLAN: r0=480(x), r1=210(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 210
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
