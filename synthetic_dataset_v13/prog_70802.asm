; DESCRIPTION: Renders a blue box of size 50x75 starting at (67, 38).
; PLAN: r0=67(x), r1=38(y), r2=50(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 38
LDI r2, 50
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
