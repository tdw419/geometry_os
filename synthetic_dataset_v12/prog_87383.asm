; DESCRIPTION: Renders a white box of size 63x67 starting at (20, 165).
; PLAN: r0=20(x), r1=165(y), r2=63(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 165
LDI r2, 63
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
