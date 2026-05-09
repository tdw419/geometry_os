; DESCRIPTION: Renders a cyan disk with center (186, 92) and radius 65.
; PLAN: r0=186(x), r1=92(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 92
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
