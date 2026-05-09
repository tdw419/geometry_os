; DESCRIPTION: Renders a blue box of size 73x85 starting at (284, 92).
; PLAN: r0=284(x), r1=92(y), r2=73(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 92
LDI r2, 73
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
