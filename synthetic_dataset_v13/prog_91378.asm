; DESCRIPTION: Renders a black box of size 82x52 starting at (420, 163).
; PLAN: r0=420(x), r1=163(y), r2=82(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 163
LDI r2, 82
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
