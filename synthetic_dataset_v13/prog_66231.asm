; DESCRIPTION: Renders a cyan disk with center (71, 213) and radius 25.
; PLAN: r0=71(x), r1=213(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 213
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
