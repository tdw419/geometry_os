; DESCRIPTION: Renders a white box of size 43x109 starting at (264, 72).
; PLAN: r0=264(x), r1=72(y), r2=43(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 72
LDI r2, 43
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
