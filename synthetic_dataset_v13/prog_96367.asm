; DESCRIPTION: Renders a blue box of size 113x38 starting at (26, 16).
; PLAN: r0=26(x), r1=16(y), r2=113(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 16
LDI r2, 113
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
