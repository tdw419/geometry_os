; DESCRIPTION: Renders a orange disk with center (398, 215) and radius 39.
; PLAN: r0=398(x), r1=215(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 215
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
