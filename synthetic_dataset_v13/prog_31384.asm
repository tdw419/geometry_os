; DESCRIPTION: Renders a blue box of size 82x32 starting at (316, 172).
; PLAN: r0=316(x), r1=172(y), r2=82(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 172
LDI r2, 82
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
