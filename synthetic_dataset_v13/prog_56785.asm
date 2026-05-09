; DESCRIPTION: Renders a cyan disk with center (131, 68) and radius 16.
; PLAN: r0=131(x), r1=68(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 68
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
