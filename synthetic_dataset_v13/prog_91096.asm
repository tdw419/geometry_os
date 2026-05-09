; DESCRIPTION: Renders a yellow box of size 18x67 starting at (182, 84).
; PLAN: r0=182(x), r1=84(y), r2=18(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 84
LDI r2, 18
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
