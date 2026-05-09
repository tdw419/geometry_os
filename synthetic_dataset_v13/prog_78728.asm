; DESCRIPTION: Renders a blue box of size 43x31 starting at (225, 120).
; PLAN: r0=225(x), r1=120(y), r2=43(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 120
LDI r2, 43
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
