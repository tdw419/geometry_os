; DESCRIPTION: Renders a purple box of size 67x42 starting at (341, 66).
; PLAN: r0=341(x), r1=66(y), r2=67(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 66
LDI r2, 67
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
