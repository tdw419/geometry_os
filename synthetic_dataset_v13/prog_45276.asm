; DESCRIPTION: Renders a white box of size 79x113 starting at (28, 56).
; PLAN: r0=28(x), r1=56(y), r2=79(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 56
LDI r2, 79
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
