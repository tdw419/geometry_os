; DESCRIPTION: Renders a orange disk with center (392, 191) and radius 63.
; PLAN: r0=392(x), r1=191(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 191
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
