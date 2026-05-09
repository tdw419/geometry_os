; DESCRIPTION: Renders a purple box of size 45x32 starting at (245, 84).
; PLAN: r0=245(x), r1=84(y), r2=45(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 84
LDI r2, 45
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
