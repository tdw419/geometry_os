; DESCRIPTION: Renders a purple box of size 76x72 starting at (291, 143).
; PLAN: r0=291(x), r1=143(y), r2=76(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 143
LDI r2, 76
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
