; DESCRIPTION: Renders a white box of size 19x56 starting at (441, 12).
; PLAN: r0=441(x), r1=12(y), r2=19(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 12
LDI r2, 19
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
