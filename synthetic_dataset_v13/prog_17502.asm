; DESCRIPTION: Renders a green box of size 100x30 starting at (28, 12).
; PLAN: r0=28(x), r1=12(y), r2=100(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 12
LDI r2, 100
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
