; DESCRIPTION: Renders a black box of size 42x36 starting at (255, 23).
; PLAN: r0=255(x), r1=23(y), r2=42(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 23
LDI r2, 42
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
