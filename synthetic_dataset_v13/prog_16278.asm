; DESCRIPTION: Renders a purple box of size 53x16 starting at (45, 14).
; PLAN: r0=45(x), r1=14(y), r2=53(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 14
LDI r2, 53
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
