; DESCRIPTION: Renders a blue box of size 74x85 starting at (255, 38).
; PLAN: r0=255(x), r1=38(y), r2=74(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 38
LDI r2, 74
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
