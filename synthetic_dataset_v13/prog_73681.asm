; DESCRIPTION: Renders a orange disk with center (135, 149) and radius 55.
; PLAN: r0=135(x), r1=149(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 149
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
