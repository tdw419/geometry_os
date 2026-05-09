; DESCRIPTION: Renders a blue box of size 40x10 starting at (113, 172).
; PLAN: r0=113(x), r1=172(y), r2=40(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 172
LDI r2, 40
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
