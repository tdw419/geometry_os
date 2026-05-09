; DESCRIPTION: Renders a black box of size 50x14 starting at (113, 3).
; PLAN: r0=113(x), r1=3(y), r2=50(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 3
LDI r2, 50
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
