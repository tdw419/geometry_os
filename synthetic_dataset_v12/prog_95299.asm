; DESCRIPTION: Renders a white box of size 74x48 starting at (264, 194).
; PLAN: r0=264(x), r1=194(y), r2=74(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 194
LDI r2, 74
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
