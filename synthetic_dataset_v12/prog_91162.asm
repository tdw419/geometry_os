; DESCRIPTION: Renders a cyan disk with center (361, 173) and radius 80.
; PLAN: r0=361(x), r1=173(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 173
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
