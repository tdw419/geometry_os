; DESCRIPTION: Renders a white box of size 85x26 starting at (319, 134).
; PLAN: r0=319(x), r1=134(y), r2=85(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 134
LDI r2, 85
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
