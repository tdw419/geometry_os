; DESCRIPTION: Renders a cyan disk with center (281, 116) and radius 26.
; PLAN: r0=281(x), r1=116(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 116
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
