; DESCRIPTION: Renders a green box of size 90x52 starting at (375, 60).
; PLAN: r0=375(x), r1=60(y), r2=90(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 60
LDI r2, 90
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
