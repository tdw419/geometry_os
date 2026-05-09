; DESCRIPTION: Renders a black box of size 50x26 starting at (128, 67).
; PLAN: r0=128(x), r1=67(y), r2=50(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 67
LDI r2, 50
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
