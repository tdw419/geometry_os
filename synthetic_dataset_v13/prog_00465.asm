; DESCRIPTION: Renders a green box of size 29x72 starting at (118, 5).
; PLAN: r0=118(x), r1=5(y), r2=29(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 5
LDI r2, 29
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
