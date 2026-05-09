; DESCRIPTION: Renders a white box of size 76x28 starting at (295, 158).
; PLAN: r0=295(x), r1=158(y), r2=76(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 158
LDI r2, 76
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
