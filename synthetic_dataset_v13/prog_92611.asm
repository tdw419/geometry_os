; DESCRIPTION: Renders a green box of size 64x34 starting at (126, 73).
; PLAN: r0=126(x), r1=73(y), r2=64(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 73
LDI r2, 64
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
