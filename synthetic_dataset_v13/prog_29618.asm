; DESCRIPTION: Renders a purple box of size 51x42 starting at (244, 45).
; PLAN: r0=244(x), r1=45(y), r2=51(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 45
LDI r2, 51
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
