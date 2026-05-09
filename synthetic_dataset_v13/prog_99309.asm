; DESCRIPTION: Renders a white box of size 56x22 starting at (151, 215).
; PLAN: r0=151(x), r1=215(y), r2=56(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 215
LDI r2, 56
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
