; DESCRIPTION: Places a orange circle of radius 24 at center (228, 206).
; PLAN: r0=228(x), r1=206(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 206
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
