; DESCRIPTION: Renders a green box of size 45x56 starting at (47, 63).
; PLAN: r0=47(x), r1=63(y), r2=45(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 63
LDI r2, 45
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
