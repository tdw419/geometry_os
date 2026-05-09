; DESCRIPTION: Renders a red disk with center (154, 110) and radius 50.
; PLAN: r0=154(x), r1=110(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 110
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
