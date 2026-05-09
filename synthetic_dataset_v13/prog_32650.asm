; DESCRIPTION: Renders a green box of size 42x114 starting at (263, 30).
; PLAN: r0=263(x), r1=30(y), r2=42(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 30
LDI r2, 42
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
