; DESCRIPTION: Renders a orange disk with center (305, 150) and radius 27.
; PLAN: r0=305(x), r1=150(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 150
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
