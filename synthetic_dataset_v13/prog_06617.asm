; DESCRIPTION: Renders a purple box of size 69x42 starting at (312, 164).
; PLAN: r0=312(x), r1=164(y), r2=69(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 164
LDI r2, 69
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
