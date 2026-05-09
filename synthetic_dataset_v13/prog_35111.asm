; DESCRIPTION: Renders a black box of size 103x54 starting at (304, 136).
; PLAN: r0=304(x), r1=136(y), r2=103(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 136
LDI r2, 103
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
