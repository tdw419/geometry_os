; DESCRIPTION: Renders a blue box of size 50x83 starting at (199, 170).
; PLAN: r0=199(x), r1=170(y), r2=50(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 170
LDI r2, 50
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
