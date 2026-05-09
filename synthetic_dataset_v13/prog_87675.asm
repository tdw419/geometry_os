; DESCRIPTION: Renders a cyan disk with center (152, 207) and radius 17.
; PLAN: r0=152(x), r1=207(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 207
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
