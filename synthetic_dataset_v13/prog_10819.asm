; DESCRIPTION: Renders a yellow box of size 72x67 starting at (164, 106).
; PLAN: r0=164(x), r1=106(y), r2=72(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 106
LDI r2, 72
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
