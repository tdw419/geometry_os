; DESCRIPTION: Renders a white box of size 107x115 starting at (310, 100).
; PLAN: r0=310(x), r1=100(y), r2=107(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 100
LDI r2, 107
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
