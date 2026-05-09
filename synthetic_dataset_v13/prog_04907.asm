; DESCRIPTION: Renders a white box of size 35x113 starting at (90, 17).
; PLAN: r0=90(x), r1=17(y), r2=35(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 17
LDI r2, 35
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
