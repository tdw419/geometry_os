; DESCRIPTION: Renders a cyan disk with center (154, 94) and radius 56.
; PLAN: r0=154(x), r1=94(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 94
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
