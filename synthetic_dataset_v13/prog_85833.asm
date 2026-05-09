; DESCRIPTION: Renders a blue box of size 12x115 starting at (128, 93).
; PLAN: r0=128(x), r1=93(y), r2=12(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 93
LDI r2, 12
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
