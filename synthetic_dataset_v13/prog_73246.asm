; DESCRIPTION: Renders a black box of size 112x49 starting at (228, 13).
; PLAN: r0=228(x), r1=13(y), r2=112(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 13
LDI r2, 112
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
