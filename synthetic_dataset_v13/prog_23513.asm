; DESCRIPTION: Renders a orange box of size 62x113 starting at (228, 4).
; PLAN: r0=228(x), r1=4(y), r2=62(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 4
LDI r2, 62
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
