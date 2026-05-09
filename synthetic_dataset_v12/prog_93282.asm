; DESCRIPTION: Renders a orange disk with center (231, 206) and radius 41.
; PLAN: r0=231(x), r1=206(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 206
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
