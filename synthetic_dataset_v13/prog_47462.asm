; DESCRIPTION: Renders a cyan disk with center (331, 173) and radius 55.
; PLAN: r0=331(x), r1=173(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 173
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
