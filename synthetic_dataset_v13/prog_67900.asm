; DESCRIPTION: Renders a white box of size 46x40 starting at (270, 189).
; PLAN: r0=270(x), r1=189(y), r2=46(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 189
LDI r2, 46
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
