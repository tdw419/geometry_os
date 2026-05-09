; DESCRIPTION: Renders a black box of size 120x26 starting at (67, 50).
; PLAN: r0=67(x), r1=50(y), r2=120(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 50
LDI r2, 120
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
