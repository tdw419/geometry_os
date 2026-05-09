; DESCRIPTION: Renders a cyan disk with center (162, 107) and radius 18.
; PLAN: r0=162(x), r1=107(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 107
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
