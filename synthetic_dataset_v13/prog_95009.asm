; DESCRIPTION: Renders a white box of size 91x10 starting at (415, 17).
; PLAN: r0=415(x), r1=17(y), r2=91(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 17
LDI r2, 91
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
