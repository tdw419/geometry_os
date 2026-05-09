; DESCRIPTION: Renders a orange disk with center (398, 116) and radius 22.
; PLAN: r0=398(x), r1=116(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 116
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
