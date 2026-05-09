; DESCRIPTION: Renders a white box of size 14x49 starting at (206, 12).
; PLAN: r0=206(x), r1=12(y), r2=14(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 12
LDI r2, 14
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
