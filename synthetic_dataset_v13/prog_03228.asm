; DESCRIPTION: Renders a cyan disk with center (334, 146) and radius 72.
; PLAN: r0=334(x), r1=146(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 146
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
