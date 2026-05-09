; DESCRIPTION: Renders a white box of size 113x91 starting at (203, 10).
; PLAN: r0=203(x), r1=10(y), r2=113(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 10
LDI r2, 113
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
