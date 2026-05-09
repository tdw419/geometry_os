; DESCRIPTION: Renders a white box of size 72x88 starting at (385, 27).
; PLAN: r0=385(x), r1=27(y), r2=72(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 27
LDI r2, 72
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
