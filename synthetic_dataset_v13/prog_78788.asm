; DESCRIPTION: Renders a cyan disk with center (368, 164) and radius 35.
; PLAN: r0=368(x), r1=164(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 164
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
