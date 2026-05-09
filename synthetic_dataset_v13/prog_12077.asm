; DESCRIPTION: Renders a blue box of size 30x84 starting at (439, 6).
; PLAN: r0=439(x), r1=6(y), r2=30(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 6
LDI r2, 30
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
