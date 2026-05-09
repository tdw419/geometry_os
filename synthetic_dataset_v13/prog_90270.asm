; DESCRIPTION: Renders a green box of size 38x11 starting at (442, 126).
; PLAN: r0=442(x), r1=126(y), r2=38(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 126
LDI r2, 38
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
