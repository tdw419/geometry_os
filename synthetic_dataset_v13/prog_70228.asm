; DESCRIPTION: Renders a cyan disk with center (281, 160) and radius 11.
; PLAN: r0=281(x), r1=160(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 160
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
