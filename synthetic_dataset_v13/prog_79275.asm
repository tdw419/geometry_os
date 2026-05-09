; DESCRIPTION: Renders a white disk with center (187, 186) and radius 56.
; PLAN: r0=187(x), r1=186(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 186
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
