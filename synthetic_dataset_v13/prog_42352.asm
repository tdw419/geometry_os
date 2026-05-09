; DESCRIPTION: Renders a orange disk with center (215, 133) and radius 59.
; PLAN: r0=215(x), r1=133(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 133
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
