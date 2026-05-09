; DESCRIPTION: Renders a blue box of size 32x78 starting at (434, 157).
; PLAN: r0=434(x), r1=157(y), r2=32(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 157
LDI r2, 32
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
