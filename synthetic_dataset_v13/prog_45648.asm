; DESCRIPTION: Renders a white box of size 28x112 starting at (12, 27).
; PLAN: r0=12(x), r1=27(y), r2=28(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 27
LDI r2, 28
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
