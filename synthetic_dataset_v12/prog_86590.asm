; DESCRIPTION: Renders a green box of size 109x38 starting at (310, 5).
; PLAN: r0=310(x), r1=5(y), r2=109(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 5
LDI r2, 109
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
