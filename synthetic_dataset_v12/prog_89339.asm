; DESCRIPTION: Renders a black box of size 74x60 starting at (284, 138).
; PLAN: r0=284(x), r1=138(y), r2=74(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 138
LDI r2, 74
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
