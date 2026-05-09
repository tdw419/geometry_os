; DESCRIPTION: Renders a blue box of size 56x50 starting at (96, 64).
; PLAN: r0=96(x), r1=64(y), r2=56(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 64
LDI r2, 56
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
