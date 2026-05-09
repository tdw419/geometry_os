; DESCRIPTION: Renders a yellow box of size 67x67 starting at (257, 26).
; PLAN: r0=257(x), r1=26(y), r2=67(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 26
LDI r2, 67
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
