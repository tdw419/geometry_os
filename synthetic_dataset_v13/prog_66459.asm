; DESCRIPTION: Renders a yellow box of size 29x90 starting at (254, 67).
; PLAN: r0=254(x), r1=67(y), r2=29(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 67
LDI r2, 29
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
