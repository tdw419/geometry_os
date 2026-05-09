; DESCRIPTION: Renders a red disk with center (152, 144) and radius 43.
; PLAN: r0=152(x), r1=144(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 144
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
