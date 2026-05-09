; DESCRIPTION: Renders a orange disk with center (146, 128) and radius 62.
; PLAN: r0=146(x), r1=128(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 128
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
