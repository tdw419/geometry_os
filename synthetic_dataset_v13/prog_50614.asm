; DESCRIPTION: Renders a white box of size 63x111 starting at (161, 67).
; PLAN: r0=161(x), r1=67(y), r2=63(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 67
LDI r2, 63
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
