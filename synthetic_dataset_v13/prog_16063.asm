; DESCRIPTION: Renders a blue box of size 91x50 starting at (2, 45).
; PLAN: r0=2(x), r1=45(y), r2=91(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 45
LDI r2, 91
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
