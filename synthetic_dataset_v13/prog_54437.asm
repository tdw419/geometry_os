; DESCRIPTION: Renders a cyan disk with center (340, 166) and radius 75.
; PLAN: r0=340(x), r1=166(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 166
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
