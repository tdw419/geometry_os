; DESCRIPTION: Renders a blue box of size 110x64 starting at (178, 157).
; PLAN: r0=178(x), r1=157(y), r2=110(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 157
LDI r2, 110
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
