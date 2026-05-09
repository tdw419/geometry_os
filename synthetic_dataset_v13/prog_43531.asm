; DESCRIPTION: Renders a black box of size 29x20 starting at (74, 150).
; PLAN: r0=74(x), r1=150(y), r2=29(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 150
LDI r2, 29
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
