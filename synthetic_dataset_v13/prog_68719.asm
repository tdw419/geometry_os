; DESCRIPTION: Renders a cyan disk with center (278, 152) and radius 77.
; PLAN: r0=278(x), r1=152(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 152
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
