; DESCRIPTION: Renders a yellow box of size 26x30 starting at (328, 202).
; PLAN: r0=328(x), r1=202(y), r2=26(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 202
LDI r2, 26
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
