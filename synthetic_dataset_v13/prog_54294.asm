; DESCRIPTION: Renders a cyan disk with center (285, 131) and radius 50.
; PLAN: r0=285(x), r1=131(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 131
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
