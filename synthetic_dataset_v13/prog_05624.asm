; DESCRIPTION: Renders a orange disk with center (317, 111) and radius 50.
; PLAN: r0=317(x), r1=111(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 111
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
