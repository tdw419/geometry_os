; DESCRIPTION: Renders a blue box of size 40x10 starting at (107, 173).
; PLAN: r0=107(x), r1=173(y), r2=40(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 173
LDI r2, 40
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
