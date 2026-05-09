; DESCRIPTION: Renders a white box of size 68x67 starting at (168, 112).
; PLAN: r0=168(x), r1=112(y), r2=68(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 112
LDI r2, 68
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
