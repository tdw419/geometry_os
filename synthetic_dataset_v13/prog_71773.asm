; DESCRIPTION: Renders a white box of size 47x52 starting at (375, 166).
; PLAN: r0=375(x), r1=166(y), r2=47(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 166
LDI r2, 47
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
