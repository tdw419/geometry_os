; DESCRIPTION: Renders a cyan disk with center (281, 129) and radius 32.
; PLAN: r0=281(x), r1=129(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 129
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
