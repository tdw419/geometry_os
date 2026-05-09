; DESCRIPTION: Renders a green box of size 34x29 starting at (373, 203).
; PLAN: r0=373(x), r1=203(y), r2=34(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 203
LDI r2, 34
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
