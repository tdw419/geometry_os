; DESCRIPTION: Renders a green disk with center (295, 182) and radius 14.
; PLAN: r0=295(x), r1=182(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 182
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
