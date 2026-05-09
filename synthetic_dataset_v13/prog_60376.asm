; DESCRIPTION: Renders a white box of size 11x23 starting at (372, 141).
; PLAN: r0=372(x), r1=141(y), r2=11(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 141
LDI r2, 11
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
