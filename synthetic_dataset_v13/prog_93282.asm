; DESCRIPTION: Renders a green box of size 96x32 starting at (247, 128).
; PLAN: r0=247(x), r1=128(y), r2=96(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 128
LDI r2, 96
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
