; DESCRIPTION: Renders a green box of size 11x95 starting at (442, 60).
; PLAN: r0=442(x), r1=60(y), r2=11(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 60
LDI r2, 11
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
