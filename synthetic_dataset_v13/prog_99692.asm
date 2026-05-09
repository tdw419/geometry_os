; DESCRIPTION: Renders a cyan disk with center (365, 129) and radius 70.
; PLAN: r0=365(x), r1=129(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 129
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
