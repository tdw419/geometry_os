; DESCRIPTION: Renders a orange box of size 32x100 starting at (136, 113).
; PLAN: r0=136(x), r1=113(y), r2=32(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 113
LDI r2, 32
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
