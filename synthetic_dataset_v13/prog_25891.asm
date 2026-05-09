; DESCRIPTION: Renders a green box of size 12x113 starting at (203, 134).
; PLAN: r0=203(x), r1=134(y), r2=12(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 134
LDI r2, 12
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
