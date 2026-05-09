; DESCRIPTION: Renders a cyan disk with center (281, 138) and radius 29.
; PLAN: r0=281(x), r1=138(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 138
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
