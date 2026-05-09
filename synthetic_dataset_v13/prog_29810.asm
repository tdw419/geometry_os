; DESCRIPTION: Renders a yellow box of size 10x67 starting at (141, 75).
; PLAN: r0=141(x), r1=75(y), r2=10(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 75
LDI r2, 10
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
