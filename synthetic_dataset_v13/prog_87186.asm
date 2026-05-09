; DESCRIPTION: Renders a cyan disk with center (273, 107) and radius 60.
; PLAN: r0=273(x), r1=107(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 107
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
