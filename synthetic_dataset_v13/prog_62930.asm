; DESCRIPTION: Renders a blue box of size 116x50 starting at (37, 164).
; PLAN: r0=37(x), r1=164(y), r2=116(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 164
LDI r2, 116
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
