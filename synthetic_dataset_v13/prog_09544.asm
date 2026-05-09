; DESCRIPTION: Renders a blue box of size 52x42 starting at (192, 128).
; PLAN: r0=192(x), r1=128(y), r2=52(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 128
LDI r2, 52
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
