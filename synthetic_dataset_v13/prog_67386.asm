; DESCRIPTION: Renders a cyan disk with center (209, 72) and radius 50.
; PLAN: r0=209(x), r1=72(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 72
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
