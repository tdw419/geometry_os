; DESCRIPTION: Renders a white box of size 44x56 starting at (325, 44).
; PLAN: r0=325(x), r1=44(y), r2=44(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 44
LDI r2, 44
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
