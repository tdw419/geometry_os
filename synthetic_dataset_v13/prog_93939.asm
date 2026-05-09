; DESCRIPTION: Renders a cyan disk with center (424, 205) and radius 32.
; PLAN: r0=424(x), r1=205(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 205
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
