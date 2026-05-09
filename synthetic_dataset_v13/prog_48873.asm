; DESCRIPTION: Renders a black box of size 74x120 starting at (154, 17).
; PLAN: r0=154(x), r1=17(y), r2=74(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 17
LDI r2, 74
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
