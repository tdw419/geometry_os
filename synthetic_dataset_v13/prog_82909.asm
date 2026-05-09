; DESCRIPTION: Renders a white box of size 43x27 starting at (332, 139).
; PLAN: r0=332(x), r1=139(y), r2=43(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 139
LDI r2, 43
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
