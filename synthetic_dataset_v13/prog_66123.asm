; DESCRIPTION: Renders a cyan disk with center (103, 194) and radius 56.
; PLAN: r0=103(x), r1=194(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 194
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
